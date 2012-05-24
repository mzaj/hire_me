
require File.expand_path(File.dirname(__FILE__) + "/../app/boot")


RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.include Rack::Test::Methods
end

def app
  Sinatra::Application
end

