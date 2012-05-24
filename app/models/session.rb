module HireMe
  module Models
    class Session
      attr_accessor :user_first_name, :user_last_name, :questions
    end

    def to_hash
      hash = {
        :user_first_name => user_first_name,
        :user_last_name => user_last_name,
        :questions => []
      }
      questions.each { |q| hash[:questions].add(q.to_hash) }
      hash
    end
  end
end

