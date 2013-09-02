class AgregarIntencionDeSolicitudATrabajos < ActiveRecord::Migration
  def up
    change_table :trabajos do |t|
      t.string :intencion, :default => "averiguar"
    end
  end

  def down
    remove_column :trabajos, :intencion
  end
end
