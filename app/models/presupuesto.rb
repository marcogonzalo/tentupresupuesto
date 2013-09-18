#encoding: utf-8
class Presupuesto < ActiveRecord::Base
  #before_validation :notacion_float
  
  attr_accessible :con_iva, :precio_maximo, :precio_minimo, :resumen, :visto, :tipo_estimacion, 
  
  MOTIVO_RECHAZO  = [:da_pocos_detalles, :muy_barato, :muy_caro, :no_confiable, :no_responde, :ubicacion_lejana, :otro]
  TIPO_ESTIMACION = [:metro_lineal,:metro_cuadrado,:metro_cubico,:total]
  
  belongs_to :trabajo
  belongs_to :proveedor
  has_many :mensajes
  
  
  validate  :rango_precio_valido
  validates :resumen, 
            :length => {  :in => 10..1000 },
            :presence => true
  validates :precio_minimo, 
            :presence => true
  validates :precio_maximo, 
            :presence => true
  validates :motivo_rechazo,
            :inclusion => { :in => MOTIVO_RECHAZO },
            :allow_blank => true

  rails_admin do
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
      field :trabajo
      field :proveedor do
        column_width 100
      end
      field :precio_minimo do
        column_width 75
        label "Mínimo"
      end
      field :precio_maximo do
        column_width 75
        label "Máximo"
      end
      field :aprobado do
        column_width 50
      end
      field :rechazado do
        column_width 50
      end
      field :updated_at do
        date_format :abrev
      end
    end
    show do
      configure :resumen do
        pretty_value do
          %{<pre>#{value}</pre>}.html_safe
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
      configure :aprobado do
        read_only false
      end
      configure :rechazado do
        read_only false
      end
      configure :motivo_rechazo do
        read_only false
      end
    end
    #     export do; end
    #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
    #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
    #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end

  # RAILS_ADMIN
  def motivo_rechazo_enum
    MOTIVO_RECHAZO
  end
  
  #ACCIONES
  def incluye_iva
    if con_iva then "Con IVA"
    else "Sin IVA"
    end
  end
  
  def fue_visto
    if visto then "Visto por el cliente"
    else "No ha sido visto por el cliente"
    end
  end
  
  def rango_precio_valido
    self.precio_minimo = precio_minimo * (-1) if precio_minimo < 0
    self.precio_maximo = precio_maximo * (-1) if precio_maximo < 0
    unless precio_minimo < precio_maximo
      errors.add(:precio_maximo, "debe ser mayor al mínimo")
    end
  end
  
  def notacion_float
    # Elimina el punto solo cuando es seguido de tres digitos
    # self.precio_minimo = (self.precio_minimo.to_s.gsub(/\.([0-9]{3})$/, '\1'))
    # self.precio_maximo = (self.precio_maximo.to_s.gsub(/\.([0-9]{3})$/, '\1'))
    
    # Sustituye la coma por punto solo cuando es seguida de dos digitos
    # self.precio_minimo = (self.precio_minimo.to_s.gsub(/,([0-9]{2})$/, '.\1'))
    # self.precio_maximo = (self.precio_maximo.to_s.gsub(/,([0-9]{2})$/, '.\1'))
  end
end
