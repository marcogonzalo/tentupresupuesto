class CreateSolicitantes < ActiveRecord::Migration
  def change
    create_table :solicitantes, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string  :cedula,                   :limit => 20, :null => false, :default => ""
      t.string  :calle_avenida,            :limit => 50, :null => true,  :default => ""
      t.string  :casa_edificio,            :limit => 25, :null => true,  :default => ""
      t.string  :numero_apto,              :limit => 10, :null => true,  :default => ""
      t.string  :punto_referencia,         :limit => 50, :null => true,  :default => ""
      t.integer :solicitudes_realizadas,                 :null => false, :default => 0
      t.integer :trabajos_recibidos,                     :null => false, :default => 0

      t.timestamps
    end
    add_index :solicitantes,  :cedula,               :unique => true
  end
end
