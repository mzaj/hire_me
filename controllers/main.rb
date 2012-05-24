

get '/' do
  erb :start, :layout => :default
end

get '/start' do
  first_name = params[:first_name]
  last_name = params[:last_name]

  question_service = HireMe::Models::SessionService.new
  session_id = question_service.start_session({:first_name => first_name, :last_name => last_name})

  @session_id = session_id
  @questions = question_service.get_questions(session_id)
  @current_question = question_service.get_question(@questions.first.id)
  erb :question, :layout => :default
end

get 'question/:session_id/:question_id' do
  question_id = params[:question_id]
  session_id = params[:session_id]
  @session_id = session_id
  question_service = HireMe::Models::SessionService.new
  @questions = question_service.get_questions(session_id)
  @current_question = question_service.get_question(question_id)

  erb :question, :layout => nil  
end

post 'answer/:session_id/:question_id' do
  question_id = params[:question_id]
  session_id = params[:session_id]
  question_service = HireMe::Models::SessionService.new
  answer = JSON.parse(params[:answer])
  question_service.save_answer(session_id, question_id, answer)
end


