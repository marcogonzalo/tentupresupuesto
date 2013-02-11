set :deploy_to, "/home/agapito/html/desarrollo/"
set :keep_releases, 5                                         # Number of old releases to keep

set :branch, 'capistrano'

set :rails_env,      "staging"
set :migrate_env,    "staging"

namespace :staging do
  desc "Clear the application's cache"
  task :clear_cache do
    run "(cd #{current_path} && rake RAILS_ENV=staging clear)"
  end
end

after "deploy:symlink", "staging:clear_cache"