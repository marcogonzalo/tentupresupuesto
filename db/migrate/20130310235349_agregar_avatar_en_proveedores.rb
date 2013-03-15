class AgregarAvatarEnProveedores < ActiveRecord::Migration
  def up
    change_table :proveedores do |t|
      t.string :avatar
    end
    add_index :proveedores, :avatar
  end

  def down
    remove_index :proveedores, :column => :avatar
    remove_column :proveedores, :avatar
  end
end
