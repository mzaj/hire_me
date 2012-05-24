module HireMe
  module Models
    class QuestionService
      def get_first_question
        generate_questions_list.first
      end

      def get_next_question
      end

      def save_answer(question_number, answers)
      end

      def calculate_result
      end

      private

      def generate_questions_list
        question_repository.get_all_questions
      end

      def question_repository
        @question_repository ||= HireMe::Storage::QuestionRepository.new
      end
    end
  end
end
