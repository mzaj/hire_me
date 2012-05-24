# encoding: UTF-8

task :default => 'start'

# Load all external files
Dir["app/tasks/**/*.rake*"].sort.each {|ext| load ext}

desc "Run sinatra web server"
task :start do
  sh "bundle exec shotgun -o 0.0.0.0 -p 4567 ./app/boot.rb"
end

# Returns the current filename, used in various tasks for logging
def current_module
  File.basename(__FILE__, ".rb")
end
