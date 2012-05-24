
require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe 'Main controller' do

  let(:questions) do
    q1 = OpenStruct.new
    q1.id = "4321"

    q2 = OpenStruct.new
    q2.id = "0987"

    [q1, q2]
  end

  context 'start' do
    it 'should generate session_id, questions and current question based on first name and last name' do
      HireMe::Models::SessionService.any_instance.should_receive(:start_session).with({:first_name => "Wojciech", :last_name => "Maryszczak"}).and_return("1234")
      HireMe::Models::SessionService.any_instance.should_receive(:get_questions).with("1234").and_return(questions)
      HireMe::Models::SessionService.any_instance.should_receive(:get_question).with("4321").and_return(questions.first)

      url = '/start?first_name=Wojciech&last_name=Maryszczak'
      resp = get url, {}
      resp.status.should == 200
      
    end
  end
end
