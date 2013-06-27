class Evaluacion < ActiveRecord::Base
  before_create :set_total
  attr_accessible :atencion, :calidad, :limpieza, :observaciones, :precio, :responsabilidad, 
                  :respuesta_proveedor, :tiempo, :total
  
  has_many :imagenes, :as => :imagenable, :dependent => :destroy
  belongs_to :proveedor
  belongs_to :trabajo
  
  default_scope order('created_at DESC')
  
  validates :atencion,
            :presence => true

  validates :calidad,
            :presence => true
            
  validates :precio,
            :presence => true
            
  validates :responsabilidad,
            :presence => true
            
  validates :tiempo,
            :presence => true
  
  rails_admin do
  #   # You can copy this to a 'rails_admin do ... end' block inside your evaluacion.rb model definition

  #   # Found associations:

  #     configure :trabajo, :belongs_to_association 
  #     configure :proveedor, :belongs_to_association 
  #     configure :imagenes, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :trabajo_id, :integer         # Hidden 
  #     configure :proveedor_id, :integer         # Hidden 
  #     configure :total, :float 
  #     configure :atencion, :float 
  #     configure :calidad, :float 
  #     configure :limpieza, :float 
  #     configure :precio, :float 
  #     configure :responsabilidad, :float 
  #     configure :tiempo, :float 
  #     configure :observaciones, :string 
  #     configure :respuesta_proveedor, :string 
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

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end
  
  #ACCIONES
  
  private
  def set_total
    contados = 0
    contabilizacion = 0.0
    if self.atencion.blank?
      self.atencion = nil 
    else
      contados = contados+1
      contabilizacion = contabilizacion + self.atencion
    end
    if self.calidad.blank?
      self.calidad = nil
    else
      contados = contados+1
      contabilizacion = contabilizacion + self.calidad
    end
    if self.limpieza.blank?
      self.limpieza = nil
    else
      contados = contados+1
      contabilizacion = contabilizacion + self.limpieza
    end
    if self.precio.blank?
      self.precio = nil 
    else
      contados = contados+1
      contabilizacion = contabilizacion + self.precio
    end
    if self.responsabilidad.blank?
      self.responsabilidad = nil 
    else
      contados = contados+1
      contabilizacion = contabilizacion + self.responsabilidad
    end
    if self.tiempo.blank?
      self.tiempo = nil 
    else
      contados = contados+1
      contabilizacion = contabilizacion + self.tiempo
    end
    self.total = (contabilizacion/contados).to_f
  end
end
