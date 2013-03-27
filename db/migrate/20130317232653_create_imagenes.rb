class CreateImagenes < ActiveRecord::Migration
  def change
    create_table :imagenes do |t|
      t.string  :archivo,           :null => false
      t.string  :descripcion,       :null => true
      t.string  :proposito,         :null => true,  :limit => 20
      t.integer :imagenable_id,     :null => false
      t.string  :imagenable_type,   :null => false

      t.timestamps
    end
    
    add_index :imagenes, [:imagenable_type, :imagenable_id], :name => 'index_imagenes_on_imtype_imid'
    add_index :imagenes, [:imagenable_type, :imagenable_id, :proposito], :name => 'index_imagenes_on_imtype_imid_proposito'
  end
end
