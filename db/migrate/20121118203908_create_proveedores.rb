class CreateProveedores < ActiveRecord::Migration
  def change
    create_table :proveedores, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string  :nombre_empresa,         :limit => 50, :null => false, :default => ""
      t.string  :tipo_proveedor,         :limit => 30, :null => false, :default=> :independiente
      t.string  :rif,                    :limit => 20, :null => true,  :default => ""
      t.text    :descripcion,                          :null => false, :default => ""
      t.boolean :verificado,                           :null => false, :default => false
      t.string  :telefono_local,         :limit => 20, :null => false, :default => ""
      t.string  :telefono_movil,         :limit => 20, :null => false, :default => ""
      t.string  :telefono_alt,           :limit => 20, :null => false, :default => ""
      t.string  :direccion,              :limit => 255, :null => true,  :default => ""
      t.string  :punto_referencia,       :limit => 50, :null => true,  :default => ""
      t.integer :solicitudes_atendidas,                :null => false, :default => 0
      t.integer :trabajos_realizados,                  :null => false, :default => 0
      t.float   :reputacion,                           :null => false, :default => 0.0
      t.integer :valoraciones,                         :null => false, :default => 0
      
      t.timestamps
    end
    add_index :proveedores,  :rif,               :unique => true
  end
end
