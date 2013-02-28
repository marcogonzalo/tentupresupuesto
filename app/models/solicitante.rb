#encoding: utf-8
class Solicitante < ActiveRecord::Base
  attr_accessible :cedula, :calle_avenida, :casa_edificio, :numero_apto, :direccion, :punto_referencia,
                  :telefono_local, :telefono_movil, :telefono_alt, :pais_id, :estado_id, :municipio_id, :localidad_id
  
  has_one :usuario, :as => :perfilable
  has_many :trabajos
  belongs_to :pais, :class_name => "UbicacionGeografica", :foreign_key => "pais_id", :conditions => "tipo = 'pais'"
  belongs_to :estado, :class_name => "UbicacionGeografica", :foreign_key => "estado_id", :conditions => "tipo = 'estado'"
  belongs_to :municipio, :class_name => "UbicacionGeografica", :foreign_key => "municipio_id", :conditions => "tipo = 'municipio'"
  belongs_to :localidad, :class_name => "UbicacionGeografica", :foreign_key => "localidad_id", :conditions => "tipo = 'localidad'"
  
  validates :cedula, 
            :length => { :in => 5..10 }, 
            :numericality =>  { 
                                :only_integer => true,
                                :greater_than => 50000
                              }, 
            :presence => true
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
  validates :localidad_id,
            :presence => true
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
