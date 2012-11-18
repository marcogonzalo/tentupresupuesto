class CreateProveedores < ActiveRecord::Migration
  def change
    create_table :proveedores do |t|
      t.string :nombre
      t.string :apellido
      
      t.timestamps
    end
  end
end
