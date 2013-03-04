#encoding: utf-8
class Presupuesto < ActiveRecord::Base
  attr_accessible :con_iva, :precio_maximo, :precio_minimo, :resumen, :visto
  
  belongs_to :trabajo
  belongs_to :proveedor
  has_many :mensajes
  
  default_scope order('created_at')
  
  MOTIVO_RECHAZO = [:da_pocos_detalles, :muy_barato, :muy_caro, :no_confiable, :no_responde, :otro]
  
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
  validates :motivo_rechazo,
            :inclusion => { :in => MOTIVO_RECHAZO },
            :allow_blank => true
  
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
