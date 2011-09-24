require 'bundler/capistrano'

set :application, "robolucha"

set :scm, :git
set :repository,  "ssh://lacie2/home/samba/repos/robolucha.git"

set :user, 'crasch'
set :use_sudo, false
set :deploy_via, :remote_cache
set :deploy_to, "/home/#{user}/public_html/#{application}"

role :web, "lacie2"                          # Your HTTP server, Apache/etc
role :app, "lacie2"                          # This may be the same as your `Web` server
role :db,  "lacie2", :primary => true        # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
after 'deploy', 'deploy:cleanup'
