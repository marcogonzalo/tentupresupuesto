class AgregarSlugEnProveedores < ActiveRecord::Migration
  def up
    change_table :proveedores do |t|
      t.string :slug, :null => false, :default => ''
    end
    add_index :proveedores, :slug, :unique => true
  end

  def down
    remove_index :proveedores, :column => :slug
    change_table :proveedores do |t|
       t.remove :slug
    end
  end
end
