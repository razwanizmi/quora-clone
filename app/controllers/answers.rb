get '/questions/:question_id/answers/new' do
  erb :"answers/new_answer"
end

post '/questions/:question_id/answers' do
  answer = Answer.new(params[:answer].merge(user_id: current_user.id, question_id: params[:question_id]))
  answer.save
  redirect '/questions/index'
end