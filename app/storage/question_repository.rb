module HireMe
  module Storage
    class QuestionRepository
      include StorageHelper

      def get_all_questions
        collection.find.collect { |q| HireMe::Models::Question.from_hash(q) }
      end

      def get_question(id)
        question_hash = collection.find_one(BSON::ObjectId.from_string(id)).to_hash
        HireMe::Models::Question.from_hash(question_hash)
      end
      private

      def collection
        @collection ||= get_collection('questions')
      end
    end
  end
end
