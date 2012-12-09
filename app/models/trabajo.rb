class Trabajo < ActiveRecord::Base
  attr_accessible :descripcion, :direccion, :estatus, :precio_final, :proposito
  has_many :presupuestos
  belongs_to :solicitante, :inverse_of => :trabajo
  belongs_to :contratado, :class_name => "Proveedor", :foreign_key => "contratado_id"
  
  
end
