module HireMe
  module Models
    class Session
      attr_accessor :user_first_name, :user_last_name, :questions

      def initialize
        @questions = []
      end

      def self.from_hash(session_hash)
        session = Session.new
        session.user_first_name = session_hash['user_first_name']
        session.user_last_name = session_hash['user_last_name']

        session_hash['questions'].each do |question_hash|
          session.questions << Question.from_hash(question_hash)
        end

        puts session.inspect
        session
      end


      def to_hash
        hash = {
          :user_first_name => user_first_name,
          :user_last_name => user_last_name,
          :questions => []
        }

        questions.each { |q| hash[:questions] << q.to_hash }
        hash
      end

      def add_answer(question_id, answer)
      end
    end
  end
end

