module HireMe
  module Models
    class Question
      attr_accessor :id, :text, :type, :answers

      def initialize
        @answers = []
      end

      def self.from_hash(question_hash)
        Question.new.tap do |question|
          question.id = question_hash['_id'].to_s
          question.text = question_hash['text']
          question.type = question_hash['type']
          question_hash['answers'].each { |a| question.answers << a }
        end
      end

      def to_hash
        {
          :_id => id,
          :text => text,
          :type => type,
          :answers => answers
        }
      end

      def answered?
        false
      end
    end
  end
end
