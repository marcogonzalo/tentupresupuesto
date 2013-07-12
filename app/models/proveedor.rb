#encoding: utf-8
class Proveedor < ActiveRecord::Base
  include FriendlyId
  friendly_id :nombre_empresa, :use => [:slugged, :history]
  before_save :set_rif_blank_to_nil
  
  mount_uploader :avatar, AvatarUploader
  
  attr_accessible :nombre_empresa, :tipo_proveedor, :rif, :descripcion,
                  :telefono_local, :telefono_movil, :telefono_alt,
                  :direccion, :punto_referencia, :correo_electronico,
                  :categoria_ids, :pais_id, :estado_id, :municipio_id, :localidad_id,
                  :web_url, :twitter_url, :facebook_url, :google_url, :linkedin_url, 
                  :youtube_url, :pinterest_url, :instagram_url
  
  has_one :usuario, :as => :perfilable
  has_many :imagenes, :as => :imagenable, :dependent => :destroy
  has_many :trabajos, :foreign_key => "contratado_id"
  has_many :presupuestos
  has_many :evaluaciones
  has_and_belongs_to_many :categorias,
      :after_add => :increment_proveedores_asociados,
      :after_remove => :decrement_proveedores_asociados
  belongs_to :pais, :class_name => "UbicacionGeografica", :foreign_key => "pais_id", :conditions => "tipo = 'pais'"
  belongs_to :estado, :class_name => "UbicacionGeografica", :foreign_key => "estado_id", :conditions => "tipo = 'estado'"
  belongs_to :municipio, :class_name => "UbicacionGeografica", :foreign_key => "municipio_id", :conditions => "tipo = 'municipio'"
  belongs_to :localidad, :class_name => "UbicacionGeografica", :foreign_key => "localidad_id", :conditions => "tipo = 'localidad'"
  
  TIPO_EMPRESA = ["independiente", "cooperativa","empresa_produccion_social","empresa_privada"] 

  validates :nombre_empresa, 
            :length => { :in => 3..50 }
  validates :tipo_proveedor,
            :inclusion => { :in => TIPO_EMPRESA },
            :presence => true
  validates :rif,
            :format => { 
                          :with => /^((V|J)-([0-9]{8})-([0-9]{1}))$/,
                          :message => "no coincide con el formato (V-########-# ó J-########-#)" 
                       }, 
            :allow_blank => true
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
  validates :solicitudes_atendidas, 
            :numericality =>  {
                                :only_integer => true,
                                :greater_than_or_equal_to => 0
                              }
  validates :trabajos_realizados, 
            :numericality =>  {
                                :only_integer => true,
                                :greater_than_or_equal_to => 0
                              }
  validates :reputacion, 
            :numericality =>  {
                                :greater_than_or_equal_to => 0
                              }
  validates :valoraciones, 
            :numericality =>  { 
                                :only_integer => true,
                                :greater_than_or_equal_to => 0
                              }
  validates :slug, :presence => true
  validates :web_url,
            :format =>  {
                          :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix,
                          :message => "tiene un formato inválido"
                        },
            :allow_blank => true
  validates :twitter_url,
            :format =>  {
                          :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix,
                          :message => "tiene un formato inválido"
                        },
            :allow_blank => true
  validates :facebook_url,
            :format =>  {
                          :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix,
                          :message => "tiene un formato inválido"
                        },
            :allow_blank => true
  validates :google_url,
            :format =>  {
                          :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix,
                          :message => "tiene un formato inválido"
                        },
            :allow_blank => true
  validates :linkedin_url,
            :format =>  {
                          :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix,
                          :message => "tiene un formato inválido"
                        },
            :allow_blank => true
  validates :youtube_url,
            :format =>  {
                          :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix,
                          :message => "tiene un formato inválido"
                        },
            :allow_blank => true
  validates :pinterest_url,
            :format =>  {
                          :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix,
                          :message => "tiene un formato inválido"
                        },
            :allow_blank => true
  validates :instagram_url,
            :format =>  {
                          :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix,
                          :message => "tiene un formato inválido"
                        },
            :allow_blank => true
  
  # validate :minimo_de_categorias # Removida por dar problemas al editar otros atributos 
  
  rails_admin do
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

      object_label_method :nombre_empresa     # Name of the method called for pretty printing an *instance* of ModelName
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
        field :usuario do
          inverse_of :perfilable
        end
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
      edit do
        configure :verificado do
          read_only false
        end
        
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
  
  # RAILS_ADMIN
  def tipo_proveedor_enum
    TIPO_EMPRESA
  end

  # ACCIONES
  def translated_tipo_proveedor
    I18n.t(tipo_proveedor, :scope => "activerecord.attributes.proveedor.tipos_proveedor")
  end
  
  private
  def increment_proveedores_asociados(categoria)
    categoria.proveedores_asociados += 1
    categoria.save
  end
 
  def decrement_proveedores_asociados(categoria)
    categoria.proveedores_asociados -= 1
    categoria.save
  end
  
  def minimo_de_categorias
    unless categorias.size > 0 or new_record?
      errors.add(:categorias, "debe asociarse al menos una categoría")
      return false
    end
  end

  def set_rif_blank_to_nil
    self.rif = nil if self.rif.blank?
  end
end
