Kaminari.configure do |config|
  config.default_per_page = 3
  config.max_per_page     = 100
  config.window           = 1     # A los lados de la pagina actual
  config.outer_window     = 2     # A los extremos
  config.param_name       = :p
end