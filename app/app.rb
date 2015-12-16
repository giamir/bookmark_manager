ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :sessions, true
  set :public, 'public'

  get '/links' do
    @message = session.delete(:message)
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(title: params[:title], url: params[:url])
    params[:tag].split(/[,+ *]+/).each do |tag_name|
      tag = Tag.first_or_create(name: tag_name)
      link.tags << tag
    end
    link.save
    session[:message] = 'Link successfully added'
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/register' do
    erb :register
  end

  post '/register' do
    User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:message] = "Welcome #{User.last.name}!"
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
