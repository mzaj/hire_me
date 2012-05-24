

get '/' do
  "Hello"
end

get 'first' do
  content_type 'application/json'

  first_name = params[:first_name]
  last_name = params[:last_name]
  start_time = Time.now

  session[:first_name] = first_time
  session[:last_name] = last_name
  session[:start_time] = start_time

  HireMe::Models::QuestionService.new.get_first_question({:first_name => first_name, :last_name => last_name, :start_time => start_time})
end
