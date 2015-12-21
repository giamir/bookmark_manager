class BookmarkManager < Sinatra::Base
  get '/sessions/new' do
    @user = User.new
    erb :'sessions/new'
  end

  post '/sessions' do
    user_id = User.authenticate(params[:email], params[:password])
    if user_id
      session[:user_id] = user_id
      redirect to('/links')
    else
      flash.now[:errors] = 'Email or password is not correct'
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    flash.next[:notice] = "Goodbye #{current_user.name}!"
    session.clear
    redirect '/links'
  end
end
