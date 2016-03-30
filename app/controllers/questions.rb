get '/questions/new' do
  erb :"questions/new_question"
end

post '/questions' do
  question = Question.new(params[:question])
  question[:user_id] = current_user.id
  question.save
    redirect '/questions/index'
end

get '/questions/index' do
  erb :"questions/all"
end

get '/questions/:id' do
  @question =Question.find(params[:id])
  erb :"questions/current"
end