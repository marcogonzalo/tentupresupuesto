#encoding: utf-8
class Trabajo < ActiveRecord::Base
  include FriendlyId
  friendly_id :proposito, :use => [:slugged, :history]
  
  attr_accessible :descripcion, :direccion, :estatus, :precio_final, :proposito,
                  :categoria_id, :pais_id, :estado_id, :municipio_id, :localidad_id
  
  has_many :presupuestos
  belongs_to :solicitante, :inverse_of => :trabajo
  belongs_to :contratado, :class_name => "Proveedor", :foreign_key => "contratado_id"
  belongs_to :categoria
  belongs_to :pais, :class_name => "UbicacionGeografica", :foreign_key => "pais_id", :conditions => "tipo = 'pais'"
  belongs_to :estado, :class_name => "UbicacionGeografica", :foreign_key => "estado_id", :conditions => "tipo = 'estado'"
  belongs_to :municipio, :class_name => "UbicacionGeografica", :foreign_key => "municipio_id", :conditions => "tipo = 'municipio'"
  belongs_to :localidad, :class_name => "UbicacionGeografica", :foreign_key => "localidad_id", :conditions => "tipo = 'localidad'"
  
  ESTATUS = ["buscando","ejecutando","finalizado","cancelado"]
  default_scope order('created_at DESC')
  scope :estatus_buscando, where(:estatus => 'buscando')
  scope :estatus_ejecutando, where(:estatus => 'ejecutando')
  scope :estatus_finalizado, where(:estatus => 'finalizado')
  scope :estatus_cerrado, where(:estatus => 'cerrado')
  
  validates :proposito, 
            :length => { :in => 10..100 }, 
            :presence => true
  validates :descripcion,
            :length => { :in => 25..500 }, 
            :presence => true
  validates :estatus,
            :inclusion => { :in => ESTATUS }
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
  validates :categoria_id,
            :presence => true
  validates :direccion,
            :length => { :in => 10..250 }, 
            :presence => true
  validates :precio_final, 
            :numericality =>  { :greater_than_or_equal_to => 0 }
  validates :slug, :presence => true
end
