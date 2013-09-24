#encoding: utf-8
class UbicacionGeografica < ActiveRecord::Base
  include FriendlyId
  friendly_id :slug_ubicacion, :use => :slugged
  
  attr_accessible :nombre, :tipo, :entidad_id, :slug
  
  default_scope order('nombre ASC')
  
  has_many :entidades, :class_name => "UbicacionGeografica", :foreign_key => "entidad_id", :order => "nombre ASC"
  belongs_to :entidad_superior, :class_name => "UbicacionGeografica", :foreign_key => "entidad_id"
  has_many :proveedores_de_pais, :class_name => "Proveedor", :foreign_key => "pais_id"
  has_many :proveedores_de_estado, :class_name => "Proveedor", :foreign_key => "estado_id"
  has_many :proveedores_de_municipio, :class_name => "Proveedor", :foreign_key => "municipio_id"
  has_many :proveedores_de_localidad, :class_name => "Proveedor", :foreign_key => "localidad_id"
  has_many :solicitantes_de_pais, :class_name => "Solicitante", :foreign_key => "pais_id"
  has_many :solicitantes_de_estado, :class_name => "Solicitante", :foreign_key => "estado_id"
  has_many :solicitantes_de_municipio, :class_name => "Solicitante", :foreign_key => "municipio_id"
  has_many :solicitantes_de_localidad, :class_name => "Solicitante", :foreign_key => "localidad_id"
  has_many :trabajos_de_pais, :class_name => "Trabajo", :foreign_key => "pais_id"
  has_many :trabajos_de_estado, :class_name => "Trabajo", :foreign_key => "estado_id"
  has_many :trabajos_de_municipio, :class_name => "Trabajo", :foreign_key => "municipio_id"
  has_many :trabajos_de_localidad, :class_name => "Trabajo", :foreign_key => "localidad_id"
  has_and_belongs_to_many :proveedores
  
  TIPO_UBICACION = ["pais","estado","municipio","localidad"]
  
  validates :nombre,
            :presence => true
  validates :tipo,
            :inclusion => { :in => TIPO_UBICACION },
            :presence => true
  
  rails_admin do
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

      object_label_method :ubicacion_tipo_nombre_entidad     # Name of the method called for pretty printing an *instance* of ModelName
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
        field :tipo
        field :entidad_superior
      end
  #     show do; end
      edit do
        configure :entidad_superior do
          associated_collection_cache_all false  # REQUIRED if you want to SORT the list as below
          associated_collection_scope do
            # bindings[:object] & bindings[:controller] are available, but not in scope's block!
            elemento = bindings[:object]
            Proc.new { |scope|
              # scoping all Players currently, let's limit them to the team's league
              # Be sure to limit if there are a lot of Players and order them by position
              if elemento.present? and not elemento.tipo.eql?("pais")
                case elemento.tipo
                when "localidad"
                  scope = scope.where(tipo: "municipio")
                when "municipio"
                  scope = scope.where(tipo: "estado")
                when "estado"
                  scope = scope.where(tipo: "pais")
                end
                scope = scope.limit(30).reorder('ubicacion_geografica.nombre DESC') # REorder, not ORDER
              end
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
  def tipo_enum
    TIPO_UBICACION
  end

  # ACCIONES    
  def self.buscar_o_crear_id_de_localidad(localidad,municipio_id)
    unless localidad.blank?
      nombre_entidad = localidad.split(' ').map {|w| w.capitalize }.join(' ')
      ug = UbicacionGeografica.where(:nombre => nombre_entidad, :tipo => 'localidad', :entidad_id => municipio_id).first()
      if ug.nil? or ug.id <= 0
        ug = UbicacionGeografica.new(:nombre => nombre_entidad, :tipo => 'localidad', :entidad_id => municipio_id)
        ug.save
      end
      return ug.id
    end
    return nil
  end
  
  
  private
  def slug_ubicacion
    unless self.entidad_id.nil? or self.entidad_superior.nil?
      return self.entidad_superior.friendly_id+"_"+self.nombre
    end
    return self.nombre
  end
end
