require 'sinatra/base'
require_relative 'models/link'

ENV['RACK_ENV'] ||= 'development'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/links' do
    @message = session.delete(:message)
    @links = Link.all
    erb :'links/index'
  end

  get '/new' do
    erb :'links/new'
  end

  post '/links' do
    Link.create(title: params[:Title], url: params[:url])
    session[:message] = 'Link successfully added'
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
