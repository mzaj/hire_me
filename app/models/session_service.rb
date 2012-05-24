module HireMe
  module Models
    class SessionService 
      def start_session(user)
        question_list = generate_questions_list
        session = session_repository.create_session(user, question_list)

        session.id
      end

      def get_question(id)

      end

      def get_all_questions(session_id)
      #[(id, answered?), ..]
      end

      def get_next_question(question_id)
      end

      def save_answer(session_id, question_number, answers)
      end

      def finish_session(session_id)
        session_repository.get_session(session_id)
      end

      private

      def generate_questions_list
        question_repository.get_all_questions
      end

      def session_repository
        @session_repository ||= HireMe::Storage::SessionRepository.new
      end

      def question_repository
        @question_repository ||= HireMe::Storage::QuestionRepository.new
      end
    end
  end
end
