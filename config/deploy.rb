require "bundler/capistrano"

set :stages, %w(acceptance)
set :default_stage, "acceptance"
require 'capistrano/ext/multistage'

set :application, "hire_me"

set :user, "deploy"
set :repository,  "git://git.anixe.pl/hire_me.git"
set :scm, :git
set :git_shallow_clone, 1

set :deploy_via, :remote_cache
set :deploy_to, "/opt/hire_me"
set :use_sudo, false

set :bundle_without, [:development, :test]

default_run_options[:pty] = true                        # otherwise you won't be asked for the password
ssh_options[:forward_agent] = true

# configure crontab management
set :whenever_command, "bundle exec whenever"
require "whenever/capistrano"


#configure RVM
$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
set :rvm_type, :system

## DEPLOY
namespace :deploy do
  after "deploy", "deploy:cleanup"
  after "deploy:setup", "deploy:configure_nginx"

  task :restart do
    run "touch #{current_path}/tmp/restart.txt"

    find_servers(:roles => [:app]).each do |host|
      # ping server to restart passenger
      cmd = "curl -silent http://#{host}/hire_me >/dev/null"
      system(cmd)
    end
  end

  task :configure_nginx do
    run "ln -f -s /opt/hire_me/current/public/ /var/www/root/hire_me"
    sudo "/etc/init.d/nginx reload"
  end

  after "deploy:restart", "deploy:git:push_deploy_tag"
  before "deploy:cleanup", "deploy:git:cleanup_deploy_tag"

  namespace :git do
    desc "Place release tag into Git and push it to server."
    task :push_deploy_tag do
      user = `git config --get user.name`
      email = `git config --get user.email`

      puts `git tag #{stage}_#{release_name} #{revision} -m "Deployed by #{user} <#{email}>"`
      puts `git push --tags`
    end

    task :cleanup_deploy_tag do
      count = fetch(:keep_releases, 5).to_i
      if count >= releases.length
        logger.important "no old release tags to clean up"
      else
        logger.info "keeping #{count} of #{releases.length} release tags"

        tags = (releases - releases.last(count)).map { |release| "#{stage}_#{release}" }

        tags.each do |tag|
          `git tag -d #{tag}`
          `git push origin :refs/tags/#{tag}`
        end
      end
    end
  end

end
