class CreateSolicitantes < ActiveRecord::Migration
  def change
    create_table :solicitantes do |t|
      t.string  :nombre_persona,           :limit => 50, :null => false, :default => ""
      t.string  :sexo,                     :limit => 10, :null => true,  :default => nil
      t.date    :fecha_nacimiento,                       :null => true
      t.string  :telefono_local,           :limit => 20, :null => true,  :default => ""
      t.string  :telefono_movil,           :limit => 20, :null => true,  :default => ""
      t.string  :telefono_alt,             :limit => 20, :null => true,  :default => ""
      t.string  :direccion,                :limit => 255, :null => true,  :default => ""
      t.string  :punto_referencia,         :limit => 50, :null => true,  :default => ""
      t.integer :solicitudes_realizadas,                 :null => false, :default => 0
      t.integer :trabajos_recibidos,                     :null => false, :default => 0

      t.timestamps
    end
    add_index :solicitantes, :sexo
    add_index :solicitantes, :fecha_nacimiento
    add_index :solicitantes, :solicitudes_realizadas
    add_index :solicitantes, :trabajos_recibidos
  end
end
