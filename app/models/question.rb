module HireMe
  module Models
    class Question
      attr_accessor :id, :text

      def to_hash
        {
          :id => id,
          :text => text
        }
      end
    end
  end
end
