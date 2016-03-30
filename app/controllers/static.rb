get '/' do
  erb :"static/index"
end

get '/test' do
  erb :"static/test"
end

get '/top_stories' do
  erb :"static/top_stories"
end