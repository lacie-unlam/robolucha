require 'bundler/capistrano'

set :application, "robolucha"

set :scm, :git
set :branch, :ggg
set :repository,  "git://lacie2/robolucha.git"

# default_run_options[:pty] = true
default_environment['PATH'] = '$PATH:/var/lib/gems/1.9.1/bin'
default_environment['http_proxy'] = 'http://lacie2:3128'
set :user, 'crasch'
set :use_sudo, false
set :deploy_via, :remote_cache
set :deploy_to, "/home/#{user}/public_html/#{application}"

role :web, "ggg"                          # Your HTTP server, Apache/etc
role :app, "ggg"                          # This may be the same as your `Web` server
role :db,  "ggg", :primary => true        # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
after 'deploy', 'deploy:cleanup'

namespace :rake do  
  desc 'Run a task on a remote server.'  
  # run like: cap rake:invoke task=a_certain_task  
  task :invoke do  
    run "cd #{current_release} && bundle exec rake #{ENV['task']} RAILS_ENV=#{rails_env}"  
  end  
end
