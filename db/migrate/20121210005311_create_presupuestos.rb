class CreatePresupuestos < ActiveRecord::Migration
  def change
    create_table :presupuestos do |t|
      t.float   :precio_minimo,   :null => false, :default => 0.0, :precision => 8, :scale => 2
      t.float   :precio_maximo,   :null => false, :default => 0.0, :precision => 8, :scale => 2
      t.text    :resumen,         :null => false, :default => ""
      t.boolean :con_iva,         :null => false, :default => true
      t.boolean :visto,           :null => false, :default => false
      t.boolean :aprobado,        :null => true, :default => nil
      t.boolean :rechazado,       :null => false, :default => false
      t.string  :motivo_rechazo,  :null => true, :limit => 20, :default => nil

      t.timestamps
    end
  end
end
