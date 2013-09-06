#encoding: utf-8
class Solicitante < ActiveRecord::Base
  attr_accessible :cedula, :calle_avenida, :casa_edificio, :numero_apto, :direccion, :punto_referencia,
                  :telefono_local, :telefono_movil, :telefono_alt, :pais_id, :estado_id, :municipio_id, :localidad_id
  
  has_one :usuario, :as => :perfilable
  has_many :trabajos
  belongs_to :pais, :class_name => "UbicacionGeografica", :foreign_key => "pais_id", :conditions => "tipo = 'pais'"
  belongs_to :estado, :class_name => "UbicacionGeografica", :foreign_key => "estado_id", :conditions => "tipo = 'estado'"
  belongs_to :municipio, :class_name => "UbicacionGeografica", :foreign_key => "municipio_id", :conditions => "tipo = 'municipio'"
  belongs_to :localidad, :class_name => "UbicacionGeografica", :foreign_key => "localidad_id", :conditions => "tipo = 'localidad'"
  
  validates :cedula, 
            :length => { :in => 5..10 }, 
            :numericality =>  { 
                                :only_integer => true,
                                :greater_than => 50000
                              }
  validates :telefono_local, 
            :presence => { 
                          :message => "debe completarse si no posee teléfono móvil", 
                          :if => "telefono_movil.blank?"
                         },
            :format => { 
                          :with => /^(02)[0-9]{8,10}$/, 
                          :message => "tiene un formato inválido", 
                          :if => "!telefono_local.blank?" 
                       } 
  validates :telefono_movil, 
            :presence => { 
                          :message => "debe completarse si no posee teléfono local", 
                          :if => "telefono_local.blank?"
                         },
            :format => { 
                          :with => /^(04)(12|22|14|24|16|26)[0-9]{7,10}$/, 
                          :message => "tiene un formato inválido", 
                          :if => "!telefono_movil.blank?" 
                       } 
  validates :telefono_alt,
            :format => { 
                          :with => /^(((04)(12|22|14|24|16|26))|(02))[0-9]{7,10}$/, 
                          :message => "tiene un formato inválido", 
                          :if => "!telefono_alt.blank?"  
                       },
            :allow_blank => true
  validates :pais_id, 
            :presence => true
#            :numericality =>  {
#                                :only_integer => true,
#                                :greater_than => 0
#                              }
  validates :estado_id, 
            :presence => true
#            :numericality =>  {
#                                :only_integer => true,
#                                :greater_than => 0
#                              }
  validates :municipio_id, 
            :presence => true
#            :numericality =>  {
#                                :only_integer => true,
#                                :greater_than => 0
#                              }
#  validates :localidad_id,
#            :presence => true
#            :numericality =>  {
#                                :only_integer => true,
#                                :greater_than => 0
#                              }
  validates :direccion, 
            :length => { :in => 10..255 }, 
            :allow_blank => true
  validates :punto_referencia, 
            :length => { :in => 3..50 }, 
            :allow_blank => true
  validates :solicitudes_realizadas, 
            :numericality =>  {
                                :only_integer => true,
                                :greater_than_or_equal_to => 0
                              }
  validates :trabajos_recibidos, 
            :numericality =>  {
                                :only_integer => true,
                                :greater_than_or_equal_to => 0
                              }
                              
  rails_admin do
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
  #       sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        field :id do
          column_width 50
        end
        field :usuario do
          inverse_of :perfilable
        end
        field :solicitudes_realizadas do
          column_width 50
        end
        field :trabajos_recibidos do
          column_width 50
        end
        field :created_at do
          date_format :abrev
        end
      end
      
      show do
        configure :created_at do
          date_format :abrev
        end
        
        configure :updated_at do
          date_format :abrev
        end
      end
      
      edit do
        configure :pais do
          associated_collection_cache_all false  # REQUIRED if you want to SORT the list as below
          associated_collection_scope do
            # bindings[:object] & bindings[:controller] are available, but not in scope's block!
            elemento = bindings[:object]
            Proc.new { |scope|
              # scoping all Players currently, let's limit them to the team's league
              # Be sure to limit if there are a lot of Players and order them by position
              scope = scope.where(tipo: "pais")
              scope = scope.limit(30).reorder('ubicacion_geografica.nombre DESC') # REorder, not ORDER
            }
          end
        end
        
        configure :estado do
          associated_collection_cache_all false  # REQUIRED if you want to SORT the list as below
          associated_collection_scope do
            # bindings[:object] & bindings[:controller] are available, but not in scope's block!
            elemento = bindings[:object]
            Proc.new { |scope|
              # scoping all Players currently, let's limit them to the team's league
              # Be sure to limit if there are a lot of Players and order them by position
              scope = scope.where(tipo: "estado")
              scope = scope.limit(30).reorder('ubicacion_geografica.nombre DESC') # REorder, not ORDER
            }
          end
        end
        
        configure :municipio do
          associated_collection_cache_all false  # REQUIRED if you want to SORT the list as below
          associated_collection_scope do
            # bindings[:object] & bindings[:controller] are available, but not in scope's block!
            elemento = bindings[:object]
            Proc.new { |scope|
              # scoping all Players currently, let's limit them to the team's league
              # Be sure to limit if there are a lot of Players and order them by position
              scope = scope.where(tipo: "municipio")
              scope = scope.where(entidad_id: elemento.estado_id) if elemento.present?
              scope = scope.limit(30).reorder('ubicacion_geografica.nombre DESC') # REorder, not ORDER
            }
          end
        end
        
        configure :localidad do
          associated_collection_cache_all false  # REQUIRED if you want to SORT the list as below
          associated_collection_scope do
            # bindings[:object] & bindings[:controller] are available, but not in scope's block!
            elemento = bindings[:object]
            Proc.new { |scope|
              # scoping all Players currently, let's limit them to the team's league
              # Be sure to limit if there are a lot of Players and order them by position
              scope = scope.where(tipo: "localidad")
              scope = scope.where(entidad_id: elemento.municipio_id) if elemento.present?
              scope = scope.limit(30).reorder('ubicacion_geografica.nombre DESC') # REorder, not ORDER
            }
          end
        end
      end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end
end
