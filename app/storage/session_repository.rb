module HireMe
  module Storage
    class SessionsRepository
      include StorageHelper

      def collection
        @collection ||= get_collection('sessions')
      end
    end
  end
end
