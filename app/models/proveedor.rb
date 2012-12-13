#encoding: utf-8
class Proveedor < ActiveRecord::Base
  attr_accessible :nombre_empresa, :tipo_proveedor, :rif, :descripcion,
                  :telefono_local, :telefono_movil, :telefono_alt,
                  :direccion, :punto_referencia, :correo_electronico
  
  has_one :usuario, :as => :perfilable
  has_many :trabajos
  has_many :presupuestos
  
  validates :nombre_empresa, 
            :length => { :in => 5..50 }, 
            :allow_blank => true
  validates_columns :tipo_proveedor # Debe comentarse cuando se haga un rake db:migrate
  validates :rif,
            :format => { 
                          :with => /^(((V|J)-([0-9]{8})-([0-9]{1}))|([0-9]{5,8}))$/,  #RIF o Cedula
                          :message => "no coincide con el formato (V-########-# ó J-########-#)" 
                       }, 
            :allow_blank => true
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
  validates :direccion, 
            :length => { :in => 10..255 }, 
            :allow_blank => true
  validates :punto_referencia, 
            :length => { :in => 3..50 }, 
            :allow_blank => true
  validates :solicitudes_atendidas, 
            :numericality =>  {
                                :only_integer => true,
                                :greater_than_or_equal_to => 0
                              }
  validates :trabajos_realizados, 
            :numericality =>  {
                                :only_integer => true,
                                :greater_than_or_equal_to => 0
                              }
  validates :reputacion, 
            :numericality =>  {
                                :greater_than_or_equal_to => 0
                              }
  validates :valoraciones, 
            :numericality =>  { 
                                :only_integer => true,
                                :greater_than_or_equal_to => 0
                              }
  
  
  def translated_tipo_proveedor
    I18n.t(tipo_proveedor, :scope => "activerecord.attributes.proveedor.tipos_proveedor")
  end
end
