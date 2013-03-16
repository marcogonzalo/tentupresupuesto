# Available stages
set :stages, Dir["config/deploy/*.rb"].map{|t| File.basename(t, ".rb")}
set :default_stage, "staging"
require 'capistrano/ext/multistage'

set :application, "Ttp"
set :domain, "tentupresupuesto.com.ve" 
role :web, domain                                             # Your HTTP server, Apache/etc
role :app, domain                                             # This may be the same as your `Web` server
role :db,  domain, :primary => true                           # This is where Rails migrations will run

set :deploy_to, "/home/agapito/html/tetepe/"
set :user, "agapito"                                          # SSH user
set :password, "str4d1.v4r1us"                                # SSH user password
set :port, "2411"                                             # SSH port
set :use_sudo, false                                          # Is server user a sudoer?
set :deploy_via, :remote_cache                                # Keep a local git repo on the server and simply run a fetch from that
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
namespace :deploy do
  desc "Restart Passenger application"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t.inspect} task is a no-op with Passenger"
    task t, :roles => :app do
      # Do nothing
    end
  end
  
  desc "Prepare shared directories"
  task :prepare_shared do
    run "mkdir -p #{shared_path}/config"
    run "mkdir -p #{shared_path}/db"
  end
  
  desc "Upload config/database.yml to server's shared directory"
  task :upload_database_yml do
    put File.read("config/database.yml"), "#{shared_path}/config/database.yml", :mode => 0664
  end
  
  desc "Finish update"
  task :finish do
    # Gems
    run "cd #{release_path} && (bundle check --path=../../shared/gems || bundle --without=development:test --path=../../shared/gems)"

    # Database
    source = "#{shared_path}/config/database.yml"
    target = "#{release_path}/config/database.yml"
    begin
      run %{if test ! -f #{source}; then exit 1; fi}
      run %{ln -nsf #{source} #{target}}
    rescue Exception => e
      puts <<-HERE
ERROR!  You must have a file on your server with the database configuration.
        This file must contain absolute paths if you're using SQLite.
        You will need to upload your completed file to your server at:
            #{source}
      HERE
      raise e
    end
  end

  task :build_gems, :roles => :app do
    desc "Building gems"
    run "cd #{release_path} && bundle install --without development test"
  end
  
  
  # Hooks
  after "deploy:setup", "deploy:prepare_shared"
  after "deploy:prepare_shared", "deploy:upload_database_yml"
#  after "deploy:prepare_shared", "uploads:setup"
  after "deploy:prepare_shared", "uploads"
  after "deploy:finalize_update", "deploy:finish"
  after "deploy:finish", "deploy:create_symlink", "deploy:cleanup"
  after "deploy:finish", "deploy:restart"  
end

namespace :uploads do
  # http://www.simonecarletti.com/blog/2009/02/capistrano-uploads-folder/
  desc <<-EOD
    Creates the upload folders unless they exist
    and sets the proper upload permissions.
  EOD
  task :setup, :except => { :no_release => true } do
    dirs = uploads_dirs.map { |d| File.join(shared_path, d) }
    run "mkdir -p #{dirs.join(' ')} && #{try_sudo} chmod 0777 #{dirs.join(' ')}" # && #{try_sudo} chmod g+w #{dirs.join(' ')}"
  end

  desc <<-EOD
    [internal] Creates the symlink to uploads shared folder
    for the most recently deployed version.
  EOD
  task :symlink, :except => { :no_release => true } do
    run "rm -rf #{release_path}/public/uploads"
    run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
  end

  desc <<-EOD
    [internal] Computes uploads directory paths
    and registers them in Capistrano environment.
  EOD
  task :register_dirs do
    set :uploads_dirs,    %w(uploads)
    set :shared_children, fetch(:shared_children) + fetch(:uploads_dirs)
  end

  after       "deploy:finalize_update", "uploads:symlink"
  on :start,  "uploads:register_dirs"

end

#after "deploy:update_code", "deploy:build_gems", "deploy:migrate", "deploy:cleanup"

#after :deploy, "deploy:create_symlink", "passenger:restart"