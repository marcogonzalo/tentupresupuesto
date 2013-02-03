class AgregarUbicacionGeograficaEnSolicitantes < ActiveRecord::Migration
  def up
    change_table :solicitantes do |t|
      t.references :pais
      t.foreign_key :ubicaciones_geograficas, column: 'pais_id'
      t.references :estado
      t.foreign_key :ubicaciones_geograficas, column: 'estado_id'
      t.references :municipio
      t.foreign_key :ubicaciones_geograficas, column: 'municipio_id'
      t.references :localidad
      t.foreign_key :ubicaciones_geograficas, column: 'localidad_id'
    end
    add_index :solicitantes, :pais_id
    add_index :solicitantes, :estado_id
    add_index :solicitantes, :municipio_id
    add_index :solicitantes, :localidad_id
  end

  def down
    change_table :solicitantes do |t|
      t.remove_foreign_key column: 'pais_id'
      t.remove_foreign_key column: 'estado_id'
      t.remove_foreign_key column: 'municipio_id'
      t.remove_foreign_key column: 'localidad_id'
    end
    remove_index :solicitantes, :column => :pais_id
    remove_column :solicitantes, :pais_id
    remove_index :solicitantes, :column => :estado_id
    remove_column :solicitantes, :estado_id
    remove_index :solicitantes, :column => :municipio_id
    remove_column :solicitantes, :municipio_id
    remove_index :solicitantes, :column => :localidad_id
    remove_column :solicitantes, :localidad_id
  end
end
