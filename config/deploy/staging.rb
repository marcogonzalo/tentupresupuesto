set :deploy_to, "/home/agapito/html/desarrollo/"
set :keep_releases, 5                                         # Number of old releases to keep

set :branch, 'desarrollo'

set :rails_env,      "staging"
set :migrate_env,    "staging"

namespace :to_staging do
  task :migrations do
    desc "Migrating database"
    run 'cd #{current_path} && bundle update rake'
    run "cd #{current_path} && bundle exec rake db:migrate RAILS_ENV=staging"
  end
  
  task :seeds do
    desc "Inserting data from seeds"
    run "cd #{current_path} && bundle exec rake db:seed RAILS_ENV=staging"
  end
  
  # Regenera el sitemap en la nueva version luego de hacer deploy
  task :refresh_sitemaps do
    run "cd #{release_path} && RAILS_ENV=#{rails_env} rake sitemap:refresh:no_ping"
  end
end


after "deploy:finish", "to_staging:migrations"
after "deploy", "to_staging:refresh_sitemaps"