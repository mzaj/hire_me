module HireMe
  module Models
    class SessionService
      def start_session(user)
        question_list = generate_questions_list
        session = session_repository.create_session(user, questions)
        session.id
      end

      def get_question(id)
        question_repository.get_question(id)
      end

      def get_all_questions(session_id)
        session = session_repository.get_session(session_id)
        session.questions.collect { |q| { id: q.id, answered: q.answered? } }
      end

      def save_answer(session_id, question_id, answer)
        session = session_repository.get_session(session_id)
        session.add_answer(question_id, answer)
        session_repository.update_session(session)
      end

      def finish_session(session_id)
      end

      private

      def generate_questions_list
        question_repository.get_all_questions
      end
      private

      def session_repository
        @session_repository ||= HireMe::Storage::SessionRepository.new
      end

      def question_repository
        @question_repository ||= HireMe::Storage::QuestionRepository.new
      end

      def session
        session_repository.get_session(session_id)
      end
    end
  end
end
