class AgregarTipoEstimacionAPresupuestos < ActiveRecord::Migration
  def up
    change_table :presupuestos do |t|
      t.string :tipo_estimacion, :default => "total"
    end
  end

  def down
    remove_column :presupuestos, :tipo_estimacion
  end
end
