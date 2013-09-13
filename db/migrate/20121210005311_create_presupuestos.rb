class CreatePresupuestos < ActiveRecord::Migration
  def change
    create_table :presupuestos do |t|
      t.float   :precio_minimo,     :null => false, :default => 0.0, :precision => 8, :scale => 2
      t.float   :precio_maximo,     :null => false, :default => 0.0, :precision => 8, :scale => 2
      t.boolean :con_iva,           :null => false, :default => true
      t.string  :tipo_estimacion,                    :default => "total"
      t.text    :resumen,           :null => false, :default => ""
      t.boolean :visto,             :null => false, :default => false
      t.boolean :enviar_datos,                      :default => false
      t.integer :cant_mensajes,     :null => false, :default => 0
      t.boolean :aprobado,          :null => true, :default => nil
      t.boolean :rechazado,         :null => false, :default => false
      t.string  :motivo_rechazo,    :null => true, :limit => 20, :default => nil

      t.timestamps
    end
    add_index :presupuestos, :con_iva
    add_index :presupuestos, :tipo_estimacion
    add_index :presupuestos, :visto
    add_index :presupuestos, :aprobado
    add_index :presupuestos, :rechazado
    add_index :presupuestos, :motivo_rechazo
  end
end
