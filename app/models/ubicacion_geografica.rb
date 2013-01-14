#encoding: utf-8
class UbicacionGeografica < ActiveRecord::Base
  attr_accessible :nombre, :tipo, :entidad_id
  
  belongs_to :entidad_superior, class_name: "UbicacionGeografica", foreign_key: "entidad_id"
  has_many :entidades, class_name: "UbicacionGeografica", foreign_key: "entidad_id"
  
  TIPO_UBICACION = ["pais","estado","municipio","parroquia","localidad"]
  
  validates :nombre,
            :presence => true
  validates :tipo,
            :inclusion => { :in => TIPO_UBICACION },
            :presence => true
  validates :entidad_id,
            :allow_nil => true
            
end
