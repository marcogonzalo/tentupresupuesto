class CreateSolicitantes < ActiveRecord::Migration
  def change
    create_table :solicitantes do |t|
      t.string  :cedula,                   :limit => 20, :null => false, :default => ""
      t.string  :telefono_local,           :limit => 20, :null => true,  :default => ""
      t.string  :telefono_movil,           :limit => 20, :null => true,  :default => ""
      t.string  :telefono_alt,             :limit => 20, :null => true,  :default => ""
      t.string  :direccion,                :limit => 255, :null => true,  :default => ""
      t.string  :punto_referencia,         :limit => 50, :null => true,  :default => ""
      t.integer :solicitudes_realizadas,                 :null => false, :default => 0
      t.integer :trabajos_recibidos,                     :null => false, :default => 0

      t.timestamps
    end
  end
end
