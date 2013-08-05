set :deploy_to, "/home/agapito/html/tetepe/"
set :keep_releases, 2                                         # Number of old releases to keep

set :branch, 'master'

set :rails_env,      "staging"
set :migrate_env,    "staging"

namespace :to_production do
  task :migrations do
    desc "Migrating database"
    run 'cd #{current_path} && bundle update rake'
    run "cd #{current_path} && bundle exec rake db:migrate RAILS_ENV=#{rails_env}"
  end
  
  task :seeds do
    desc "Inserting data from seeds"
    run "cd #{current_path} && bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end
  
  # Regenera el sitemap en la nueva version luego de hacer deploy
  task :refresh_sitemaps do
    run "cd #{release_path} && bundle exec rake sitemap:refresh:no_ping RAILS_ENV=#{rails_env}"
  end
end

after "deploy:finish", "to_production:migrations"
after "deploy", "to_production:refresh_sitemaps"
