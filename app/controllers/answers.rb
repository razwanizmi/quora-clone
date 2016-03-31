get '/questions/:question_id/answers/new' do
  erb :"answers/new_answer"
end

post '/questions/:question_id/answers' do
  answer = Answer.new(params[:answer].merge(user_id: current_user.id, question_id: params[:question_id]))
  answer.save!
  redirect "/questions/#{params[:question_id]}"
end

get '/answers/:id/edit' do
  @answer = Answer.find(params[:id])
  erb :"answers/edit_answer"
end

put '/answers/:id' do
  answer = Answer.find(params[:id])
  answer.update(params[:answer])
  redirect "/questions/#{answer.question_id}"
end

delete '/answers/:id' do
  answer = Answer.find(params[:id])
  answer.destroy!
  redirect "/questions/#{params[:question_id]}"
end