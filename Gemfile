source 'https://rubygems.org'

gem 'rails', '3.2.11'

gem 'pg', "~> 0.15.1"

gem "seedbank", "~> 0.2.0"                        # Gestor de seeds para llenar la BD - https://github.com/james2m/seedbank

# Asociados a modelos
gem 'foreigner', "~> 1.4.1"                       # Soporte para Claves Foraneas en las migraciones
gem 'timeliness', "~> 0.3.6"                      # Manejo de fechas
gem 'validates_timeliness', '~> 3.0'  # Validacion de fechas en el modelo
gem "friendly_id", '~> 4.0.9'         # Identificadores amigables para url
gem "delocalize", "~> 0.3.1"                      # Cambio de formato de números y fechas según localización de manera automática - https://github.com/clemens/delocalize.

# Sesiones
gem 'devise', "~> 2.2.3"
gem 'devise-encryptable', "~> 0.1.1"

# gem 'will_paginate'                   # Paginador de resultados - https://github.com/mislav/will_paginate
gem 'kaminari', "~> 0.14.1"                          # Paginador de resultados - https://github.com/amatsuda/kaminari

# Manejo de imagenes
gem "mini_magick", "~> 3.5.0"                     # A ruby wrapper for ImageMagick command line - https://github.com/minimagick/minimagick
gem 'carrierwave', "~> 0.8.0"                     # Gestionar imágenes - https://github.com/jnicklas/carrierwave

gem 'rails_admin', "~> 0.4.8"                     # Provides an interface for managing your data - https://github.com/sferik/rails_admin

# Bibliotecas jQuery y CSS
gem 'jquery-rails', "~> 2.2.1"
gem 'client_side_validations', "~> 3.2.5"           # Validador del lado del cliente - https://github.com/bcardarella/client_side_validations

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'less-rails',   '~> 2.2.3'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'cssminify', "~> 1.0.2"
  gem 'uglifier', '>= 1.0.3'
end
gem 'twitter-bootstrap-rails', "~> 2.2.6"

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano', "~> 2.14.2"

# To use debugger
# gem 'debugger'
group :development do
  gem 'debugger'
  gem 'ruby-debug-ide'
end
