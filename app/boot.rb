HM_ROOT = File.expand_path(File.dirname(__FILE__) + '/..') unless defined?(HM_ROOT)
HM_ENV = ENV["HM_ENV"] ||= ENV["RACK_ENV"] ||= "development" unless defined?(HM_ENV)

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, HM_ENV)



Dir["#{HM_ROOT}/app/models/**/*.rb"].each { |f| require(f) }
Dir["#{HM_ROOT}/controllers/**/*.rb"].each { |f| require(f) }


