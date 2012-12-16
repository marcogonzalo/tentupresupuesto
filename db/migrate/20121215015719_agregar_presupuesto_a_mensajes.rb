class AgregarPresupuestoAMensajes < ActiveRecord::Migration
  def up
    change_table :mensajes do |t|
      t.references :presupuesto
      t.foreign_key :presupuestos, dependent: :delete
    end
    add_index :mensajes, :presupuesto_id
  end

  def down
    change_table :mensajes do |t|
      t.remove_foreign_key :presupuestos
    end
    remove_index :mensajes, :column => :presupuesto_id
    remove_index :mensajes, :column => :soli
  end
end
