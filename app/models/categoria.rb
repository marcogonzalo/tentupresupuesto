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

  rails_admin do
  #   # You can copy this to a 'rails_admin do ... end' block inside your categoria.rb model definition

  #   # Found associations:

  #     configure :categoria_padre, :belongs_to_association 
  #     configure :categorias_hijas, :has_many_association 
  #     configure :proveedores, :has_and_belongs_to_many_association 
  #     configure :trabajos, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :nombre, :string 
  #     configure :descripcion, :string 
  #     configure :padre_id, :integer         # Hidden 
  #     configure :slug, :string 
  #     configure :proveedores_asociados, :integer 
  #     configure :trabajos_asociados, :integer 
  #     configure :visible, :boolean 
  #     configure :clase_css, :string 

  #   # Cross-section configuration:

      object_label_method :nombre     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

      list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
        sort_by :nombre           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        field :id do
          column_width 50
        end
        field :nombre
        field :proveedores_asociados do
          column_width 100
        end
        field :trabajos_asociados do
          column_width 100
        end
      end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end
  
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
