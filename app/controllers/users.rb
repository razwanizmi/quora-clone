get '/users/new' do
  erb :"users/signup"
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    redirect '/'
  else
    @error = user.errors.full_messages.first
    erb :"static/error"
  end
end

get '/users/:id' do
  erb :"users/profile"
end

get '/users/:id/questions/index' do
  erb :"questions/my_questions"
end

get '/users/:id/answers/index' do
  erb :"answers/my_answers"
end