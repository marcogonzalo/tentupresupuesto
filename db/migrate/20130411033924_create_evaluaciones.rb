class CreateEvaluaciones < ActiveRecord::Migration
  def change
    create_table :evaluaciones do |t|
      t.references :trabajo,                  :null => false
      t.references :proveedor,                :null => false
      t.float :total,                         :null => false, :default => 0.0
      t.float :atencion,                      :null => true,  :default => nil
      t.float :calidad,                       :null => true,  :default => nil
      t.float :limpieza,                      :null => true,  :default => nil
      t.float :precio,                        :null => true,  :default => nil
      t.float :responsabilidad,               :null => true,  :default => nil
      t.float :tiempo,                        :null => true,  :default => nil
      t.string :observaciones,                :null => false, :default => ""
      t.string :respuesta_proveedor,          :null => false, :default => ""
      
      t.foreign_key :proveedores, dependent: :delete
      t.foreign_key :trabajos
      
      t.timestamps
    end
    add_index :evaluaciones, :trabajo_id,                :unique => true
    add_index :evaluaciones, :proveedor_id
  end
end
