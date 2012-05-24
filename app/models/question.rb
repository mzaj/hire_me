module HireMe
  module Models
    class Question
      attr_accessor :id, :text

      def self.from_hash(question_hash)
        Question.new.tap do |question|
          question.id = question_hash['_id'].to_s
          question.text = question_hash['text']
        end
      end

      def to_hash
        {
          :_id => id,
          :text => text
        }
      end

      def answered?
        false
      end
    end
  end
end
