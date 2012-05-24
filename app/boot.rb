require './app/app'

Dir["#{HM_ROOT}/controllers/**/*.rb"].each { |f| require(f) }


