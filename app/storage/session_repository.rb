module HireMe
  module Storage
    class SessionRepository
      include StorageHelper

      def collection
        @collection ||= get_collection('sessions')
      end

      def create_session(user, question_list)
        session = HireMe::Models::Session.new
        session.user_first_name = user[:first_name]
        session.user_last_name = user[:last_name]
        session.questions = question_list

        collection.save(session.to_hash).to_s
      end

      def get_session(id)
        session_hash = collection.find(id)
        HireMe::Models::Session.from_hash(session_hash)
      end

      def update_session(session)
      end
    end
  end
end
