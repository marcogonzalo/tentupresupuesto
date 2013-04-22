class Evaluacion < ActiveRecord::Base
  before_create :set_total
  
  attr_accessible :atencion, :calidad, :limpieza, :observaciones, :precio, :responsabilidad, 
                  :respuesta_proveedor, :tiempo, :total
  
  has_many :imagenes, :as => :imagenable, :dependent => :destroy
  belongs_to :proveedor
  belongs_to :trabajo
  
  default_scope order('created_at DESC')
  
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
    if self.atencion.blank?
      self.responsabilidad = nil 
    else
      contados = contados+1
      contabilizacion = contabilizacion + self.responsabilidad
    end
    if self.atencion.blank?
      self.tiempo = nil 
    else
      contados = contados+1
      contabilizacion = contabilizacion + self.tiempo
    end
    self.total = (contabilizacion/contados).to_f
  end
end