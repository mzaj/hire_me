module HireMe
  module Storage
    class SessionRepository
      include StorageHelper

      def collection
        @collection ||= get_collection('sessions')
      end
    end
  end
end
