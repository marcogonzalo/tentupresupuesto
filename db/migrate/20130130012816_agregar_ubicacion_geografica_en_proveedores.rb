class AgregarUbicacionGeograficaEnProveedores < ActiveRecord::Migration
  def up
    change_table :proveedores do |t|
      t.references :pais
      t.foreign_key :ubicaciones_geograficas, column: 'pais_id'
      t.references :estado
      t.foreign_key :ubicaciones_geograficas, column: 'estado_id'
      t.references :municipio
      t.foreign_key :ubicaciones_geograficas, column: 'municipio_id'
      t.references :localidad
      t.foreign_key :ubicaciones_geograficas, column: 'localidad_id'
    end
    add_index :proveedores, :pais_id
    add_index :proveedores, :estado_id
    add_index :proveedores, :municipio_id
    add_index :proveedores, :localidad_id
  end

  def down
    change_table :proveedores do |t|
      t.remove_foreign_key column: 'pais_id'
      t.remove_foreign_key column: 'estado_id'
      t.remove_foreign_key column: 'municipio_id'
      t.remove_foreign_key column: 'localidad_id'
    end
    remove_index :proveedores, :column => :pais_id
    remove_column :proveedores, :pais_id
    remove_index :proveedores, :column => :estado_id
    remove_column :proveedores, :estado_id
    remove_index :proveedores, :column => :municipio_id
    remove_column :proveedores, :municipio_id
    remove_index :proveedores, :column => :localidad_id
    remove_column :proveedores, :localidad_id
  end
end
