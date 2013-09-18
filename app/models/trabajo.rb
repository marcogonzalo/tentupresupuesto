#encoding: utf-8
class Trabajo < ActiveRecord::Base
  include FriendlyId
  friendly_id :proposito, :use => [:slugged, :history]
  
  attr_accessible :descripcion, :direccion, :estatus, :precio_final, :proposito, :intencion,
                  :categoria_id, :pais_id, :estado_id, :municipio_id, :localidad_id
  
  ESTATUS   = ["buscando","ejecutando","finalizado","evaluado","cerrado"]
  INTENCION = [:averiguar,:interes,:contratar]
  
  has_one :evaluacion
  has_many :presupuestos
  belongs_to :solicitante
  belongs_to :contratado, :class_name => "Proveedor", :foreign_key => "contratado_id"
  belongs_to :categoria
  belongs_to :pais, :class_name => "UbicacionGeografica", :foreign_key => "pais_id", :conditions => "tipo = 'pais'"
  belongs_to :estado, :class_name => "UbicacionGeografica", :foreign_key => "estado_id", :conditions => "tipo = 'estado'"
  belongs_to :municipio, :class_name => "UbicacionGeografica", :foreign_key => "municipio_id", :conditions => "tipo = 'municipio'"
  belongs_to :localidad, :class_name => "UbicacionGeografica", :foreign_key => "localidad_id", :conditions => "tipo = 'localidad'"
  
  default_scope order('created_at DESC')
  scope :estatus_buscando, where(:estatus => 'buscando')
  scope :estatus_ejecutando, where(:estatus => 'ejecutando')
  scope :estatus_finalizado, where(:estatus => 'finalizado')
  scope :estatus_cerrado, where(:estatus => 'cerrado')
  
  scope :sin_evaluar, {
    :joins      => "LEFT OUTER JOIN evaluaciones ON evaluaciones.trabajo_id = trabajos.id",
    :conditions => "evaluaciones.id IS NULL",
    :select     => "trabajos.*"
  }
  
  validates :proposito, 
            :length => { :in => 10..100 }, 
            :presence => true
  validates :descripcion,
            :length => { :in => 25..500 }, 
            :presence => true
  validates :estatus,
            :inclusion => { :in => ESTATUS }
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
  validates :localidad_id,
            :presence => true
#            :numericality =>  {
#                                :only_integer => true,
#                                :greater_than => 0
#                              }
  validates :categoria_id,
            :presence => true
  validates :direccion,
            :length => { :in => 10..250 }, 
            :presence => true
  validates :slug, :presence => true
  
  rails_admin do
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

      object_label_method :proposito     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

      list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
        sort_by :updated_at           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        field :id do
          column_width 50
        end
        field :proposito
        field :estatus do
          column_width 100
        end
        field :solicitante do
          column_width 100
        end
        field :contratado do
          column_width 100
        end
        field :cant_presupuestos do
          column_width 50
        end
        field :updated_at do
          date_format :abrev
        end
      end
      
      show do
        configure :descripcion do
          pretty_value do
            %{<pre style="white-space: pre-wrap;">#{value}</pre>}.html_safe
          end
        end
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
  
  # RAILS_ADMIN
  def estatus_enum
    ESTATUS
  end
  
  # ACCIONES
  def buscando?
    self.estatus == "buscando"
  end
  
  def ejecutando?
    self.estatus == "ejecutando"
  end
  
  def finalizado?
    self.estatus == "finalizado"
  end
  
  def evaluado?
    self.estatus == "evaluado"
  end
  
  def cerrado?
    self.estatus == "cerrado"
  end
  
  def presupuesto_contratado
    self.presupuestos.where(:proveedor_id => self.contratado_id).first
  end
end
