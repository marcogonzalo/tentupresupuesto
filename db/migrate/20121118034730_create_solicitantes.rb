class CreateSolicitantes < ActiveRecord::Migration
  def change
    create_table :solicitantes, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string  :cedula,                   :limit => 20, :null => false, :default => ""
      t.string  :direccion,                :limit => 255, :null => true,  :default => ""
      t.string  :punto_referencia,         :limit => 50, :null => true,  :default => ""
      t.integer :solicitudes_realizadas,                 :null => false, :default => 0
      t.integer :trabajos_recibidos,                     :null => false, :default => 0

      t.timestamps
    end
    add_index :solicitantes,  :cedula,               :unique => true
  end
end
