set :deploy_to, "/var/www/tentupresupuesto.com.ve/trapiche/"
set :keep_releases, 5                                         # Number of old releases to keep

set :branch, 'desarrollo'

set :rails_env,      "staging"
set :migrate_env,    "staging"

namespace :to_staging do
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
    run "mkdir -p #{shared_path}/sitemaps"
    run "ln -nfs #{shared_path}/sitemaps #{release_path}/public/sitemaps"
    run "cd #{current_path} && bundle exec rake sitemap:refresh:no_ping RAILS_ENV=#{rails_env}"
  end
end


after "deploy:update_code", "to_staging:migrations"
after "deploy", "to_staging:refresh_sitemaps"