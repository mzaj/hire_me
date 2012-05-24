module HireMe
  module Storage
    module StorageHelper
      def get_collection(collection_name)
        connection = Mongo::Connection.new(AppConfig["mongo_host"], 27017, {:pool_size => 5, :timeout => 600})
        db = connection['hire_me']
        db[collection_name]
      end
    end
  end
end
