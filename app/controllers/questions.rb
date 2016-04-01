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
  @questions = Question.all.paginate(:page => params[:page], :per_page => 5)
  erb :"questions/all"
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers.all.paginate(:page => params[:page], :per_page => 3)
  erb :"questions/current"
end

delete '/questions/:id' do
  question = Question.find(params[:id])
  question.destroy!
  redirect '/questions/index'
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :"questions/edit"
end

put '/questions/:id' do
  question = Question.find(params[:id])
  question.update(params[:question])
  redirect "/questions/#{params[:id]}"
end

#comment