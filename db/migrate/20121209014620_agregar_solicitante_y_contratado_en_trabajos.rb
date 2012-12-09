class AgregarSolicitanteYContratadoEnTrabajos < ActiveRecord::Migration
  def up
    change_table :trabajos do |t|
      t.references :solicitante
      t.foreign_key :solicitantes
      t.references :contratado
      t.foreign_key :proveedores, column: 'contratado_id'
    end
    add_index :trabajos, :solicitante_id
    add_index :trabajos, :contratado_id
  end

  def down
    change_table :trabajos do |t|
      t.remove_foreign_key column: 'contratado_id'
      t.remove_foreign_key :solicitantes
    end
    remove_index :trabajos, :column => :solicitante_id
    remove_index :trabajos, :column => :contratado_id
    remove_column :trabajos, :contratado_id
    remove_column :trabajos, :solicitante_id
  end
end
