#encoding: utf-8
class Categoria < ActiveRecord::Base
  include FriendlyId
  friendly_id :slug_categoria, :use => :slugged
  
  attr_accessible :padre_id, :descripcion, :nombre, :clase_css, 
                  :proveedor_ids, :trabajo_ids, :slug
                  
  has_many :categorias_hijas, :foreign_key => "padre_id", :class_name => 'Categoria'
  belongs_to :categoria_padre, :foreign_key => "padre_id", :class_name => 'Categoria'
  has_and_belongs_to_many :proveedores
  has_many :trabajos
  
  default_scope order('nombre ASC')
  scope :con_proveedores, {
    :joins      => "LEFT JOIN categorias_proveedores ON categorias.id = categorias_proveedores.categoria_id",
    :conditions => "categorias_proveedores.proveedor_id IS NOT NULL",
    :select     => "DISTINCT categorias.*"
  }
  scope :sin_proveedores, {
    :joins      => "LEFT JOIN categorias_proveedores ON categorias.id = categorias_proveedores.categoria_id",
    :conditions => "categorias_proveedores.proveedor_id IS NULL",
    :select     => "DISTINCT categorias.*"
  }
  scope :con_solicitudes, {
    :select     => "DISTINCT categorias.*",
    :from       => "trabajos, categorias",
    :conditions => "categorias.id = trabajos.categoria_id",
  }
  
  # ACCIONES
  def self.reset_proveedores_asociados
    Categoria.all.each do |c|
      cuenta_proveedores = c.proveedores.count
      c.update_attribute("proveedores_asociados",cuenta_proveedores)
    end
  end 
  
  def self.reset_trabajos_asociados
    Categoria.all.each do |c|
      cuenta_trabajos = c.trabajos.count
      c.update_attribute("trabajos_asociados",cuenta_trabajos)
    end
  end 
  
  private
  def slug_categoria
    unless self.padre_id == 0 or self.categoria_padre.nil?
      return self.categoria_padre.nombre.to_s+"_"+self.nombre
    end
    return self.nombre
  end
  
end
