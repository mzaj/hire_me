module HireMe
  module Storage
    module StorageHelper
      def get_collection(collection_name)
        connection = Mongo::Connection.new
        db = connection['hire_me']
        db[collection_name]
      end
    end
  end
end
