#encoding: utf-8
class Presupuesto < ActiveRecord::Base
  #before_validation :notacion_float
  
  attr_accessible :con_iva, :precio_maximo, :precio_minimo, :resumen, :visto
  
  belongs_to :trabajo
  belongs_to :proveedor
  has_many :mensajes
  
  MOTIVO_RECHAZO = [:da_pocos_detalles, :muy_barato, :muy_caro, :no_confiable, :no_responde, :ubicacion_lejana, :otro]
  
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
  
  #ACCIONES
  def incluye_iva
    if con_iva then "IVA incluído"
    else "IVA no incluído"
    end
  end
  
  def fue_visto
    if visto then "El cliente ha visto el presupuesto"
    else "El cliente aún no ha visto el presupuesto"
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
