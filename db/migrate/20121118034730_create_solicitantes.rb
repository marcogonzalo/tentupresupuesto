class CreateSolicitantes < ActiveRecord::Migration
  def change
    create_table :solicitantes do |t|
      t.string :nombre
      t.string :apellido

      t.timestamps
    end
  end
end
