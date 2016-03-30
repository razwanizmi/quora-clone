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

post '/users/:user_id/questions/:question_id/question_votes' do
  if params[:vote] == "Upvote"
    question_vote = QuestionVote.create(upvote: true, user_id: params[:user_id], question_id: params[:question_id])
  elsif params[:vote] == "Downvote"
    question_vote = QuestionVote.create(upvote: false, user_id: params[:user_id], question_id: params[:question_id])
  end
  redirect '/questions/index'
end

post '/users/:user_id/answers/:answer_id/answer_votes' do
  if params[:vote] == "Upvote"
    answer_vote = AnswerVote.create(upvote: true, user_id: params[:user_id], answer_id: params[:answer_id])
  elsif params[:vote] == "Downvote"
    answer_vote = AnswerVote.create(upvote: false, user_id: params[:user_id], answer_id: params[:answer_id])
  end
  redirect "/questions/#{params[:question_id]}"
end