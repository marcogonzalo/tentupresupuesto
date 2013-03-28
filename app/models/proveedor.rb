#encoding: utf-8
class Proveedor < ActiveRecord::Base
  include FriendlyId
  friendly_id :nombre_empresa, :use => [:slugged, :history]
  before_save :set_rif_blank_to_nil
  
  mount_uploader :avatar, AvatarUploader
  
  attr_accessible :nombre_empresa, :tipo_proveedor, :rif, :descripcion,
                  :telefono_local, :telefono_movil, :telefono_alt,
                  :direccion, :punto_referencia, :correo_electronico,
                  :categoria_ids, :pais_id, :estado_id, :municipio_id, :localidad_id
  
  has_one :usuario, :as => :perfilable
  has_many :imagenes, :as => :imagenable, :dependent => :destroy
  has_many :trabajos
  has_many :presupuestos
  has_and_belongs_to_many :categorias
  belongs_to :pais, :class_name => "UbicacionGeografica", :foreign_key => "pais_id", :conditions => "tipo = 'pais'"
  belongs_to :estado, :class_name => "UbicacionGeografica", :foreign_key => "estado_id", :conditions => "tipo = 'estado'"
  belongs_to :municipio, :class_name => "UbicacionGeografica", :foreign_key => "municipio_id", :conditions => "tipo = 'municipio'"
  belongs_to :localidad, :class_name => "UbicacionGeografica", :foreign_key => "localidad_id", :conditions => "tipo = 'localidad'"
  
  TIPO_EMPRESA = ["independiente", "cooperativa","empresa_produccion_social","empresa_privada"] 

  validates :nombre_empresa, 
            :length => { :in => 3..50 }
  validates :tipo_proveedor,
            :inclusion => { :in => TIPO_EMPRESA },
            :presence => true
  validates :rif,
            :format => { 
                          :with => /^((V|J)-([0-9]{8})-([0-9]{1}))$/,
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
  validates :slug, :presence => true
  
  validate :minimo_de_categorias
  
  # ACCIONES
  def translated_tipo_proveedor
    I18n.t(tipo_proveedor, :scope => "activerecord.attributes.proveedor.tipos_proveedor")
  end
  
  private
  def minimo_de_categorias
    unless categorias.size > 0 or new_record?
      errors.add(:categorias, "debe asociarse al menos una categoría")
      return false
    end
  end

  def set_rif_blank_to_nil
    self.rif = nil if self.rif.blank?
  end
end
