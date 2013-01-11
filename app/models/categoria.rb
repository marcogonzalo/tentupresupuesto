#encoding: utf-8
class Categoria < ActiveRecord::Base
  include FriendlyId
  friendly_id :slug_categoria, :use => :slugged
  
  attr_accessible :padre_id, :descripcion, :nombre, :slug, 
                  :proveedor_ids
                  
  has_many :categorias_hijas, :foreign_key => "padre_id", :class_name => 'Categoria'
  belongs_to :categoria_padre, :foreign_key => "padre_id", :class_name => 'Categoria' 
  has_and_belongs_to_many :proveedores
  
  
  private
  def slug_categoria
    unless self.padre_id == 0 or self.categoria_padre.nil?
      return self.categoria_padre.nombre.to_s+"_"+self.nombre
    end
    return self.nombre
  end
  
end
