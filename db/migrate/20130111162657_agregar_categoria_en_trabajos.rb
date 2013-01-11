class AgregarCategoriaEnTrabajos < ActiveRecord::Migration
  def up
    change_table :trabajos do |t|
      t.references :categoria
      t.foreign_key :categorias
    end
    add_index :trabajos, :categoria_id
  end

  def down
    change_table :trabajos do |t|
      t.remove_foreign_key :categorias
    end
    remove_index :trabajos, :column => :categoria_id
    remove_column :trabajos, :categoria_id
  end
end
