# RailsAdmin config file. Generated on April 07, 2013 00:02
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|


  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['TTP', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_admin } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, 'Admin'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'Admin'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  config.default_items_per_page = 25

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Admin', 'Categoria', 'Imagen', 'Mensaje', 'Presupuesto', 'Proveedor', 'Solicitante', 'Trabajo', 'UbicacionGeografica', 'Usuario']

  # Include specific models (exclude the others):
  # config.included_models = ['Admin', 'Categoria', 'Imagen', 'Mensaje', 'Presupuesto', 'Proveedor', 'Solicitante', 'Trabajo', 'UbicacionGeografica', 'Usuario']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:



  ###  Admin  ###

  config.model 'Admin' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your admin.rb model definition

  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :aprobado, :boolean 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

      list do
  #       # filters [:id, :email]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
        sort_by :email           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        
        field :id do
          column_width 50
        end
        field :email
        field :aprobado do
          column_width 100
        end
        field :current_sign_in_at do
          date_format :abrev
        end
        field :current_sign_in_ip
      end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Categoria  ###

  config.model 'Categoria' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your categoria.rb model definition

  #   # Found associations:

  #     configure :categoria_padre, :belongs_to_association 
  #     configure :categorias_hijas, :has_many_association 
  #     configure :proveedores, :has_and_belongs_to_many_association 
  #     configure :trabajos, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :nombre, :string 
  #     configure :descripcion, :string 
  #     configure :padre_id, :integer         # Hidden 
  #     configure :slug, :string 
  #     configure :proveedores_asociados, :integer 
  #     configure :trabajos_asociados, :integer 
  #     configure :visible, :boolean 
  #     configure :clase_css, :string 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

      list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
        sort_by :nombre           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        field :id do
          column_width 50
        end
        field :nombre
        field :proveedores_asociados do
          column_width 100
        end
        field :trabajos_asociados do
          column_width 100
        end
      end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Imagen  ###

  config.model 'Imagen' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your imagen.rb model definition

  #   # Found associations:

  #     configure :imagenable, :polymorphic_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :archivo, :carrierwave 
  #     configure :descripcion, :string 
  #     configure :proposito, :string 
  #     configure :imagenable_id, :integer         # Hidden 
  #     configure :imagenable_type, :string         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

      list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        field :archivo
        field :descripcion
        field :proposito
        field :imagenable do
          column_width 100
        end
        field :created_at do
          date_format :abrev
        end
      end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Mensaje  ###

  config.model 'Mensaje' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your mensaje.rb model definition

  #   # Found associations:

  #     configure :presupuesto, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :comentario, :string 
  #     configure :usuario, :string 
  #     configure :visto, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :presupuesto_id, :integer         # Hidden 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

      list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        field :presupuesto do
          column_width 100
        end
        field :usuario do
          column_width 100
        end
        field :comentario
        field :created_at do
          date_format :abrev
        end
      end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Presupuesto  ###

  config.model 'Presupuesto' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your presupuesto.rb model definition

  #   # Found associations:

  #     configure :trabajo, :belongs_to_association 
  #     configure :proveedor, :belongs_to_association 
  #     configure :mensajes, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :precio_minimo, :float 
  #     configure :precio_maximo, :float 
  #     configure :resumen, :text 
  #     configure :con_iva, :boolean 
  #     configure :visto, :boolean 
  #     configure :aprobado, :boolean 
  #     configure :rechazado, :boolean 
  #     configure :motivo_rechazo, :string 
  #     configure :cant_mensajes, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :trabajo_id, :integer         # Hidden 
  #     configure :proveedor_id, :integer         # Hidden 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

      list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        field :id do
          column_width 50
        end
        field :trabajo do
          column_width 100
        end
        field :proveedor do
          column_width 100
        end
        field :precio_minimo do
          column_width 100
        end
        field :precio_maximo do
          column_width 100
        end
        field :aprobado do
          column_width 75
        end
        field :rechazado do
          column_width 75
        end
      end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Proveedor  ###

  config.model 'Proveedor' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your proveedor.rb model definition

  #   # Found associations:

  #     configure :pais, :belongs_to_association 
  #     configure :estado, :belongs_to_association 
  #     configure :municipio, :belongs_to_association 
  #     configure :localidad, :belongs_to_association 
  #     configure :slugs, :has_many_association         # Hidden 
  #     configure :usuario, :has_one_association 
  #     configure :imagenes, :has_many_association 
  #     configure :trabajos, :has_many_association 
  #     configure :presupuestos, :has_many_association 
  #     configure :categorias, :has_and_belongs_to_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :nombre_empresa, :string 
  #     configure :tipo_proveedor, :string 
  #     configure :rif, :string 
  #     configure :descripcion, :text 
  #     configure :verificado, :boolean 
  #     configure :telefono_local, :string 
  #     configure :telefono_movil, :string 
  #     configure :telefono_alt, :string 
  #     configure :direccion, :string 
  #     configure :punto_referencia, :string 
  #     configure :solicitudes_atendidas, :integer 
  #     configure :trabajos_realizados, :integer 
  #     configure :reputacion, :float 
  #     configure :valoraciones, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :slug, :string 
  #     configure :pais_id, :integer         # Hidden 
  #     configure :estado_id, :integer         # Hidden 
  #     configure :municipio_id, :integer         # Hidden 
  #     configure :localidad_id, :integer         # Hidden 
  #     configure :avatar, :carrierwave 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

      list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        field :id do
          column_width 50
        end
        field :avatar
        field :nombre_empresa
        field :tipo_proveedor do
          column_width 150
        end
        field :verificado do
          column_width 75
        end
        field :created_at do
          date_format :abrev
        end
      end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Solicitante  ###

  config.model 'Solicitante' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your solicitante.rb model definition

  #   # Found associations:

  #     configure :pais, :belongs_to_association 
  #     configure :estado, :belongs_to_association 
  #     configure :municipio, :belongs_to_association 
  #     configure :localidad, :belongs_to_association 
  #     configure :usuario, :has_one_association 
  #     configure :trabajos, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :cedula, :string 
  #     configure :telefono_local, :string 
  #     configure :telefono_movil, :string 
  #     configure :telefono_alt, :string 
  #     configure :direccion, :string 
  #     configure :punto_referencia, :string 
  #     configure :solicitudes_realizadas, :integer 
  #     configure :trabajos_recibidos, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :pais_id, :integer         # Hidden 
  #     configure :estado_id, :integer         # Hidden 
  #     configure :municipio_id, :integer         # Hidden 
  #     configure :localidad_id, :integer         # Hidden 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

      list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
      end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Trabajo  ###

  config.model 'Trabajo' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your trabajo.rb model definition

  #   # Found associations:

  #     configure :solicitante, :belongs_to_association 
  #     configure :contratado, :belongs_to_association 
  #     configure :categoria, :belongs_to_association 
  #     configure :pais, :belongs_to_association 
  #     configure :estado, :belongs_to_association 
  #     configure :municipio, :belongs_to_association 
  #     configure :localidad, :belongs_to_association 
  #     configure :slugs, :has_many_association         # Hidden 
  #     configure :presupuestos, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :proposito, :string 
  #     configure :descripcion, :text 
  #     configure :estatus, :string 
  #     configure :direccion, :text 
  #     configure :precio_final, :decimal 
  #     configure :cant_presupuestos, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :solicitante_id, :integer         # Hidden 
  #     configure :contratado_id, :integer         # Hidden 
  #     configure :slug, :string 
  #     configure :categoria_id, :integer         # Hidden 
  #     configure :pais_id, :integer         # Hidden 
  #     configure :estado_id, :integer         # Hidden 
  #     configure :municipio_id, :integer         # Hidden 
  #     configure :localidad_id, :integer         # Hidden 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

      list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        field :id do
          column_width 50
        end
        field :proposito
        field :status do
          column_width 100
        end
        field :solicitante do
          column_width 100
        end
        field :contratado do
          column_width 100
        end
      end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  UbicacionGeografica  ###

  config.model 'UbicacionGeografica' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your ubicacion_geografica.rb model definition

  #   # Found associations:

  #     configure :entidad_superior, :belongs_to_association 
  #     configure :entidades, :has_many_association 
  #     configure :proveedores_de_pais, :has_many_association 
  #     configure :proveedores_de_estado, :has_many_association 
  #     configure :proveedores_de_municipio, :has_many_association 
  #     configure :proveedores_de_localidad, :has_many_association 
  #     configure :solicitantes_de_pais, :has_many_association 
  #     configure :solicitantes_de_estado, :has_many_association 
  #     configure :solicitantes_de_municipio, :has_many_association 
  #     configure :solicitantes_de_localidad, :has_many_association 
  #     configure :trabajos_de_pais, :has_many_association 
  #     configure :trabajos_de_estado, :has_many_association 
  #     configure :trabajos_de_municipio, :has_many_association 
  #     configure :trabajos_de_localidad, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :nombre, :string 
  #     configure :tipo, :string 
  #     configure :entidad_id, :integer         # Hidden 
  #     configure :slug, :string 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

      list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        field :id do
          column_width 50
        end
        field :nombre
        field :tipo do
          column_width 100
        end
        field :entidad
      end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Usuario  ###

  config.model 'Usuario' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your usuario.rb model definition

  #   # Found associations:

  #     configure :perfilable, :polymorphic_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :password_salt, :string         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :perfilable_id, :integer         # Hidden 
  #     configure :perfilable_type, :string         # Hidden 
  #     configure :nombre, :string 
  #     configure :sexo, :string 
  #     configure :fecha_nacimiento, :date 
  #     configure :activo, :boolean 
  #     configure :acepta_terminos, :boolean 
  #     configure :ultimo_pago, :datetime 
  #     configure :notificaciones, :boolean 
  #     configure :plan_beneficio, :string 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :confirmation_token, :string 
  #     configure :confirmed_at, :datetime 
  #     configure :confirmation_sent_at, :datetime 
  #     configure :unconfirmed_email, :string 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :authentication_token, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

      list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
        sort_by :created_at           # Sort column (default is primary key)
        sort_reverse true     # Sort direction (default is true for primary key, last created first)
        field :id do
          column_width 50
        end
        field :perfilable do
          column_width 100
        end
        field :email
        field :confirmed_at do
          date_format :abrev
        end
        field :created_at do
          date_format :abrev
        end
      end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end

end
