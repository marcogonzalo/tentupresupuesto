set :deploy_to, "/home/agapito/html/desarrollo/"
set :keep_releases, 5                                         # Number of old releases to keep

set :branch, 'capistrano'

set :rails_env,      "staging"
set :migrate_env,    "staging"

namespace :to_staging do
  task :migrations do
    desc "Migrating database"
    run "cd #{release_path} && rake db:migrate RAILS_ENV=staging"
  end
  
  task :seeds do
    desc "Inserting data from seeds"
    run "cd #{release_path} && rake db:seed RAILS_ENV=staging"
  end
end

after "deploy:finish", "to_staging:migrations", "to_staging:seeds"