set :application, "TenTuPresupuesto"
set :repository,  "git@bitbucket.org:marcogonzalo/ttp.git"
set :branch, 'desarrollo'

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/home/agapito/html/tetepe/"

role :web, "tentupresupuesto.com.ve"                          # Your HTTP server, Apache/etc
role :app, "tentupresupuesto.com.ve"                          # This may be the same as your `Web` server
role :db,  "tentupresupuesto.com.ve", :primary => true        # This is where Rails migrations will run
# role :db,  "your slave db-server here"

set :user, "agapito"                                          # SSH user
set :password, "str4d1.v4r1us"                                # SSH user password
set :port, "2411"                                             # SSH port
set :scm_username, "marcogonzalo"                             # Bitbucket user
set :use_sudo, false                                          # Is server user a sudoer?

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end