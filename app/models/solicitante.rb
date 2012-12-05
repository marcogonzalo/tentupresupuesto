#encoding: utf-8
class Solicitante < ActiveRecord::Base
  attr_accessible :cedula, :calle_avenida, :casa_edificio, :numero_apto, :direccion, :punto_referencia
  
  has_one :usuario, :as => :perfilable
  
  validates :cedula, 
            :length => { :in => 5..10 }, 
            :numericality =>  { 
                                :only_integer => true,
                                :greater_than => 50000
                              }, 
            :presence => true
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
end
