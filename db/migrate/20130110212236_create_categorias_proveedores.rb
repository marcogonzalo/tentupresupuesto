class CreateCategoriasProveedores < ActiveRecord::Migration
  def change
    create_table :categorias_proveedores, :id => false do |t|
      t.references :categoria
      t.references :proveedor
    end
    add_index :categorias_proveedores, [:categoria_id, :proveedor_id], :unique => true
    add_index :categorias_proveedores, [:proveedor_id, :categoria_id], :unique => true
  end
end
