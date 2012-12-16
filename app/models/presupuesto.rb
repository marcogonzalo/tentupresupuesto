#encoding: utf-8
class Presupuesto < ActiveRecord::Base
  attr_accessible :con_iva, :precio_maximo, :precio_minimo, :resumen, :visto
  
  belongs_to :trabajo
  belongs_to :proveedor
  has_many :mensajes
  
  validate  :rango_precio_valido
  validates :resumen, 
            :length => {  :in => 10..500 },
            :presence => true
  validates :precio_minimo, 
            :numericality =>  {
                                :greater_than_or_equal_to => 0
                              },
            :presence => true
  validates :precio_maximo, 
            :numericality =>  {
                                :greater_than_or_equal_to => 0
                              },
            :presence => true
  
  #ACCIONES
  def incluye_iva
    if con_iva then "IVA incluído"
    else "IVA no incluído"
    end
  end 
  
  def rango_precio_valido
    unless precio_minimo < precio_maximo
      errors.add(:precio_maximo, "rango de precios incorrecto")
    end
  end
end
