get '/signup' do
  erb :"static/signup"
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
    redirect '/'
  else
    @error = user.errors.full_messages.first
    erb :"static/error"
  end
end

get '/login' do
  erb :"static/login"
end

post '/login' do
  user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    @message = "Error logging in. Please ensure email and password are correct."
    erb :"static/login"
  end
end

post '/logout' do
  if logged_in?
    session[:user_id] = nil
    redirect '/'
  end
end

get '/users/:id' do
  erb :"user/profile"
end