class AgregarUbicacionGeograficaEnTrabajos < ActiveRecord::Migration
  def up
    change_table :trabajos do |t|
      t.references :pais
      t.foreign_key :ubicaciones_geograficas, column: 'pais_id'
      t.references :estado
      t.foreign_key :ubicaciones_geograficas, column: 'estado_id'
      t.references :municipio
      t.foreign_key :ubicaciones_geograficas, column: 'municipio_id'
      t.references :localidad
      t.foreign_key :ubicaciones_geograficas, column: 'localidad_id'
    end
    add_index :trabajos, :pais_id
    add_index :trabajos, :estado_id
    add_index :trabajos, :municipio_id
    add_index :trabajos, :localidad_id
  end

  def down
    change_table :trabajos do |t|
      t.remove_foreign_key column: 'pais_id'
      t.remove_foreign_key column: 'estado_id'
      t.remove_foreign_key column: 'municipio_id'
      t.remove_foreign_key column: 'localidad_id'
    end
    remove_index :trabajos, :column => :pais_id
    remove_column :trabajos, :pais_id
    remove_index :trabajos, :column => :estado_id
    remove_column :trabajos, :estado_id
    remove_index :trabajos, :column => :municipio_id
    remove_column :trabajos, :municipio_id
    remove_index :trabajos, :column => :localidad_id
    remove_column :trabajos, :localidad_id
  end
end
