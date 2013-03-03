#encoding: utf-8
class UbicacionGeografica < ActiveRecord::Base
  include FriendlyId
  friendly_id :slug_ubicacion, :use => :slugged
  
  attr_accessible :nombre, :tipo, :entidad_id, :slug
  
  has_many :entidades, :class_name => "UbicacionGeografica", :foreign_key => "entidad_id", :order => "nombre ASC"
  belongs_to :entidad_superior, :class_name => "UbicacionGeografica", :foreign_key => "entidad_id"
  has_many :proveedores_de_pais, :class_name => "Proveedor", :foreign_key => "pais_id"
  has_many :proveedores_de_estado, :class_name => "Proveedor", :foreign_key => "estado_id"
  has_many :proveedores_de_municipio, :class_name => "Proveedor", :foreign_key => "municipio_id"
  has_many :proveedores_de_localidad, :class_name => "Proveedor", :foreign_key => "localidad_id"
  has_many :solicitantes_de_pais, :class_name => "Solicitante", :foreign_key => "pais_id"
  has_many :solicitantes_de_estado, :class_name => "Solicitante", :foreign_key => "estado_id"
  has_many :solicitantes_de_municipio, :class_name => "Solicitante", :foreign_key => "municipio_id"
  has_many :solicitantes_de_localidad, :class_name => "Solicitante", :foreign_key => "localidad_id"
  has_many :trabajos_de_pais, :class_name => "Trabajo", :foreign_key => "pais_id"
  has_many :trabajos_de_estado, :class_name => "Trabajo", :foreign_key => "estado_id"
  has_many :trabajos_de_municipio, :class_name => "Trabajo", :foreign_key => "municipio_id"
  has_many :trabajos_de_localidad, :class_name => "Trabajo", :foreign_key => "localidad_id"
  
  TIPO_UBICACION = ["pais","estado","municipio","localidad"]
  
  validates :nombre,
            :presence => true
  validates :tipo,
            :inclusion => { :in => TIPO_UBICACION },
            :presence => true
  
  # ACCIONES    
  def self.buscar_o_crear_id_de_entidad(nombre,tipo,entidad_superior)
    nombre_entidad = nombre.split(' ').map {|w| w.capitalize }.join(' ')
    ug = UbicacionGeografica.where(:nombre => nombre_entidad, :tipo => tipo, :entidad_id => entidad_superior).first()
    if ug.nil? or ug.id <= 0
      ug = UbicacionGeografica.new(:nombre => nombre_entidad, :tipo => tipo, :entidad_id => entidad_superior)
      ug.save
    end
    return ug.id
  end
  
  
  private
  def slug_ubicacion
    unless self.entidad_id.nil? or self.entidad_superior.nil?
      return self.entidad_superior.friendly_id+"_"+self.nombre
    end
    return self.nombre
  end
end
