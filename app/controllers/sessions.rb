get '/sessions/new' do
  erb :"users/login"
end

post '/sessions' do
  user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    @message = "Error logging in. Please ensure email and password are correct."
    erb :"users/login"
  end
end

post '/sessions/:id' do
  if logged_in?
    session[:user_id] = nil
    redirect '/'
  end
end