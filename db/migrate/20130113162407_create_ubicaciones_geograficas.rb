class CreateUbicacionesGeograficas < ActiveRecord::Migration
  def change
    create_table :ubicaciones_geograficas do |t|
      t.string :nombre,        :limit => 100, :null => false
      t.string :tipo,          :limit => 15,  :null => false, :default => "pais"
      t.references :entidad,   :null => true,  :default => nil
      t.string  :slug,         :null => false, :default => ''
    end
    add_index :ubicaciones_geograficas, :entidad_id
    add_index :ubicaciones_geograficas, [:nombre, :tipo, :entidad_id], :unique => true
    add_index :ubicaciones_geograficas, :slug, :unique => true
  end
end
