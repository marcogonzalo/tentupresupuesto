class AgregarSlugEnTrabajos < ActiveRecord::Migration
  def up
    change_table :trabajos do |t|
      t.string :slug, :null => false, :default => ''
    end
    add_index :trabajos, :slug, :unique => true
  end

  def down
    remove_index :trabajos, :column => :slug
    change_table :trabajos do |t|
       t.remove :slug
    end
  end
end
