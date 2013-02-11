set :stages, %w(production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'

set :application, "Ttp"
role :web, "tentupresupuesto.com.ve"                          # Your HTTP server, Apache/etc
role :app, "tentupresupuesto.com.ve"                          # This may be the same as your `Web` server
role :db,  "tentupresupuesto.com.ve", :primary => true        # This is where Rails migrations will run

set :deploy_to, "/home/agapito/html/tetepe/"
set :user, "agapito"                                          # SSH user
set :password, "str4d1.v4r1us"                                # SSH user password
set :port, "2411"                                             # SSH port
set :use_sudo, false                                          # Is server user a sudoer?
# set :deploy_via, :remote_cache                                # Keep a local git repo on the server and simply run a fetch from that
set :keep_releases, 3                                         # Number of old releases to keep
# role :db,  "your slave db-server here"

set :scm, :git 
set :repository,  "git@bitbucket.org:marcogonzalo/ttp.git"
set :scm_username, "tentupresupuesto"                         # Bitbucket user
set :branch, 'capistrano'

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end

  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end
end

namespace :passenger do
  desc "Restart Application"  
  task :restart do  
    run "touch #{current_path}/tmp/restart.txt"  
  end
end

after :deploy, 'deploy:symlink_db', "passenger:restart"