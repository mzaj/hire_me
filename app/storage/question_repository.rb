module HireMe
  module Storage
    class QuestionRepository
      include StorageHelper

      def get_all_questions
        collection.find.collect { |q| HireMe::Models::Question.from_hash(q) }
      end

      private

      def collection
        @collection ||= get_collection('questions')
      end
    end
  end
end
