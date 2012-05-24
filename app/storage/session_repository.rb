module HireMe
  module Storage
    class SessionRepository
      include StorageHelper

      def collection
        @collection ||= get_collection('sessions')
      end

      def create_session(user, question_list)
        sessions = collection['sessions']

        session = Session.new
        session.user_first_name = user[:first_name]
        session.user_last_name = user[:last_name]
        session.questions = question_list

        sessions.save(session.to_hash)
      end
    end
  end
end
