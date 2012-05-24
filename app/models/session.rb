module HireMe
  module Models
    class Session
      attr_accessor :user_first_name, :user_last_name, :questions

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

