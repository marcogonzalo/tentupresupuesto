set :deploy_to, "/home/agapito/html/tetepe/"
set :keep_releases, 3                                         # Number of old releases to keep

set :branch, 'master'

namespace :production do
  desc "Clear the application's cache"
  task :clear_cache do
    run "(cd #{current_path} && rake RAILS_ENV=production clear)"
  end
end

after "deploy:symlink", "production:clear_cache"
