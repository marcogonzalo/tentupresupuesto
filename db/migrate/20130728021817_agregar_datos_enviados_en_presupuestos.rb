class AgregarDatosEnviadosEnPresupuestos < ActiveRecord::Migration
  def up
    change_table :presupuestos do |t|
      t.boolean :enviar_datos, :default => false
    end
  end

  def down
    remove_column :presupuestos, :enviar_datos
  end
end
