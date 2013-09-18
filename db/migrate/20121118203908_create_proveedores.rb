class CreateProveedores < ActiveRecord::Migration
  def change
    create_table :proveedores do |t|
      t.string  :nombre_empresa,         :limit => 50, :null => false, :default => ""
      t.string  :tipo_proveedor,         :limit => 30, :null => false, :default=> :independiente
      t.string  :rif,                    :limit => 20, :null => true,  :default => ""
      t.text    :descripcion,                          :null => false, :default => ""
      t.boolean :verificado,                           :null => false, :default => false
      t.string  :nombre_persona,         :limit => 50, :null => false, :default => ""
      t.string  :sexo,                   :limit => 10, :null => true,  :default => nil
      t.date    :fecha_nacimiento,                     :null => true
      t.string  :telefono_local,         :limit => 20, :null => false, :default => ""
      t.string  :telefono_movil,         :limit => 20, :null => false, :default => ""
      t.string  :telefono_alt,           :limit => 20, :null => false, :default => ""
      t.string  :direccion,              :limit => 255, :null => true,  :default => ""
      t.string  :punto_referencia,       :limit => 50, :null => true,  :default => ""
      t.integer :solicitudes_atendidas,                :null => false, :default => 0
      t.integer :trabajos_realizados,                  :null => false, :default => 0
      t.float   :reputacion,                           :null => false, :default => 0.0
      t.integer :valoraciones,                         :null => false, :default => 0
      t.string :avatar,                 :limit => 150, :null => true
      t.string :web_url,                :limit => 150, :null => true
      t.string :twitter_url,            :limit => 100, :null => true
      t.string :facebook_url,           :limit => 100, :null => true
      t.string :google_url,             :limit => 150, :null => true
      t.string :linkedin_url,           :limit => 100, :null => true
      t.string :youtube_url,            :limit => 100, :null => true
      t.string :pinterest_url,          :limit => 100, :null => true
      t.string :instagram_url,          :limit => 100, :null => true
      
      t.timestamps
    end
    add_index :proveedores, :rif,               :unique => true
    add_index :proveedores, :sexo
    add_index :proveedores, :tipo_proveedor
    add_index :proveedores, :solicitudes_atendidas
    add_index :proveedores, :trabajos_realizados
    add_index :proveedores, :reputacion
    add_index :proveedores, :valoraciones
    add_index :proveedores, :avatar
  end
end
