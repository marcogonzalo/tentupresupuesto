set :deploy_to, "/home/agapito/html/tetepe/"
set :keep_releases, 2                                         # Number of old releases to keep

set :branch, 'master'

namespace :to_production do
  task :migrations do
    desc "Migrating database"
    run "cd #{release_path} && rake db:migrate RAILS_ENV=production"
  end
  
  task :seeds do
    desc "Inserting data from seeds"
    run "cd #{current_path} && rake db:seed RAILS_ENV=production"
  end
end
