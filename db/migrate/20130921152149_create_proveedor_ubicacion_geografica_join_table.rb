class CreateProveedorUbicacionGeograficaJoinTable < ActiveRecord::Migration
  def change
    create_table :proveedores_ubicaciones_geograficas, :id => false do |t|
      t.references :proveedor
      t.references :ubicacion_geografica
    end
    add_index :proveedores_ubicaciones_geograficas, [:ubicacion_geografica_id, :proveedor_id], :unique => true, :name => 'index_proveedores_ubicaciones_ubicacion_proveedor'
    add_index :proveedores_ubicaciones_geograficas, [:proveedor_id, :ubicacion_geografica_id], :unique => true, :name => 'index_proveedores_ubicaciones_proveedor_ubicacion'
    
    for p in Proveedor.all
      p.ubicaciones_geograficas << p.estado
    end
  end
  
end
