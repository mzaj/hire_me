module HireMe
  module Storage
    class QuestionRepository
      include StorageHelper

      def get_all_questions
        [].tap do |questions|
          collection.find.each do |question_hash|
            question = HireMe::Models::Question.new
            question.id = question_hash['_id'].to_s
            question.text = question_hash['text']
            questions << question
          end
        end
      end

      private

      def collection
        @collection ||= get_collection('questions')
      end
    end
  end
end
