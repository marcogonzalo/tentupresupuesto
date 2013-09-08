class AgregarVisitasEnTrabajosPresupuestosYProveedores < ActiveRecord::Migration
  def up
    change_table :trabajos do |t|
      t.integer :visitas, :default => 0
    end
    change_table :presupuestos do |t|
      t.integer :visitas, :default => 0
    end
    change_table :proveedores do |t|
      t.integer :visitas, :default => 0
    end
  end

  def down
    remove_column :trabajos, :visitas
    remove_column :presupuestos, :visitas
    remove_column :proveedores, :visitas
  end
end
