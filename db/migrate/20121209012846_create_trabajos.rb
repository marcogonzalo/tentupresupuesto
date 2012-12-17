class CreateTrabajos < ActiveRecord::Migration
  def change
    create_table :trabajos  do |t|
      t.string  :proposito,      :limit => 100, :null => false, :default => ""
      t.text    :descripcion,                   :null => false, :default => ""
      t.string  :estatus,        :limit => 15,  :null => false, :default=>:buscando
      t.text    :direccion,                     :null => false, :default => ""
      t.decimal :precio_final,   :precision => 8, :scale => 2, :null => false, :default => 0.0

      t.timestamps
    end
    add_index :trabajos, :estatus
  end
end
