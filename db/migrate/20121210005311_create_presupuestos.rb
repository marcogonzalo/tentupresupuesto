class CreatePresupuestos < ActiveRecord::Migration
  def change
    create_table :presupuestos, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.float :precio_minimo, :null => false, :default => 0.0, :precision => 8, :scale => 2
      t.float :precio_maximo, :null => false, :default => 0.0, :precision => 8, :scale => 2
      t.text :resumen,        :null => false, :default => ""
      t.boolean :con_iva,     :null => false, :default => true
      t.boolean :visto,       :null => false, :default => false
      t.boolean :aprobado,    :null => true, :default => nil
      t.boolean :rechazado,   :null => true, :default => nil
      t.enum :motivo_rechazo, :null => true, :limit => [:muy_caro, :muy_barato, :no_confiable, :pocos_detalles, :no_responde, :otro]

      t.timestamps
    end
  end
end
