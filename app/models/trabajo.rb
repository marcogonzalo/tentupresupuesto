#encoding: utf-8
class Trabajo < ActiveRecord::Base
  include FriendlyId
  friendly_id :proposito, :use => [:slugged, :history]
  
  attr_accessible :descripcion, :direccion, :estatus, :precio_final, :proposito
  
  has_many :presupuestos
  belongs_to :solicitante, :inverse_of => :trabajo
  belongs_to :contratado, :class_name => "Proveedor", :foreign_key => "contratado_id"
  
  ESTATUS = ["buscando","ejecutando","finalizado","cancelado"]
  scope :estatus_buscando, where(:estatus => 'buscando')
  scope :estatus_ejecutando, where(:estatus => 'ejecutando')
  scope :estatus_finalizado, where(:estatus => 'finalizado')
  scope :estatus_cerrado, where(:estatus => 'cerrado')
  
  validates :proposito, 
            :length => { :in => 10..100 }, 
            :presence => true
  validates :descripcion,
            :length => { :in => 10..500 }, 
            :presence => true
  validates :estatus,
            :inclusion => { :in => ESTATUS }
  validates :direccion,
            :presence => true
  validates :precio_final, 
            :numericality =>  { :greater_than_or_equal_to => 0 }
  validates :slug, :presence => true
end
