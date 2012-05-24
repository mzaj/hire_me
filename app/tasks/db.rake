require './app/app'

namespace :db do
  task :seed do
    connection = Mongo::Connection.new
    db = connection['hire_me']
    collection = db['questions']

    File.open('data/questions.json', 'r') do |questions_json|
      JSON.parse(questions_json.read).each do |question|
        collection.save(question)
      end
    end
  end
end
