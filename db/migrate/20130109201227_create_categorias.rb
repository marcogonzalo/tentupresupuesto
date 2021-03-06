class CreateCategorias < ActiveRecord::Migration
  def change
    create_table :categorias do |t|
      t.string  :nombre,                  :limit => 50, :null => false, :default => ""
      t.string  :descripcion,             :limit => 255, :null => true
      t.integer :padre_id,                :null => true, :default => 0
      t.string  :slug,                    :null => false, :default => ''
      t.integer :proveedores_asociados,   :null => false, :default => 0
      t.integer :trabajos_asociados,      :null => false, :default => 0
      t.boolean :visible,                 :null => false, :default => true
      t.string :clase_css,                :null => false, :default => ""
    end
    add_index :categorias, :padre_id
    add_index :categorias, :slug
  end
end
