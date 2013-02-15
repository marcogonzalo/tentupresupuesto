source 'https://rubygems.org'

gem 'rails', '3.2.11'

gem 'pg'

# Asociados a modelos
gem 'foreigner'                       # Soporte para Claves Foraneas en las migraciones
gem 'timeliness'                      # Manejo de fechas
gem 'validates_timeliness', '~> 3.0'  # Validacion de fechas en el modelo
gem "friendly_id", '~> 4.0.1'         # Identificadores amigables para url

gem "seedbank"                        # Permite manejar distintos seed para llenar la base de datos 
# https://github.com/james2m/seedbank

# Sesiones
gem 'devise'
gem 'devise-encryptable'

# Bibliotecas jQuery y CSS
gem 'jquery-rails'
gem 'modernizr-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'less-rails',   '~> 2.2.3'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'cssminify'
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'debugger'
gem 'debugger', group: [:development, :test]