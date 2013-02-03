#encoding: utf-8
class UbicacionGeografica < ActiveRecord::Base
  attr_accessible :nombre, :tipo, :entidad_id
  
  has_many :entidades, :class_name => "UbicacionGeografica", :foreign_key => "entidad_id", :order => "nombre ASC"
  belongs_to :entidad_superior, :class_name => "UbicacionGeografica", :foreign_key => "entidad_id"
  has_many :proveedores_de_pais, :class_name => "Proveedor", :foreign_key => "pais_id"
  has_many :proveedores_de_estado, :class_name => "Proveedor", :foreign_key => "estado_id"
  has_many :proveedores_de_municipio, :class_name => "Proveedor", :foreign_key => "municipio_id"
  has_many :proveedores_de_localidad, :class_name => "Proveedor", :foreign_key => "localidad_id"
  
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
end
