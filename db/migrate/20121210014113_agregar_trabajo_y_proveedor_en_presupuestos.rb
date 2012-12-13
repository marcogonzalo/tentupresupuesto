class AgregarTrabajoYProveedorEnPresupuestos < ActiveRecord::Migration
   def up
    change_table :presupuestos do |t|
      t.references :trabajo
      t.references :proveedor
      t.foreign_key :trabajos, dependent: :delete
      t.foreign_key :proveedores, dependent: :delete
    end
    add_index :presupuestos, :trabajo_id
    add_index :presupuestos, :proveedor_id
  end

  def down
    change_table :presupuestos do |t|
      t.remove_foreign_key :trabajos
      t.remove_foreign_key :proveedores
    end
    remove_index :presupuestos, :column => :trabajo_id
    remove_index :presupuestos, :column => :proveedor_id
    remove_column :presupuestos, :proveedor_id
    remove_column :presupuestos, :trabajo_id
  end
end
