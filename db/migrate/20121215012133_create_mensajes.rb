class CreateMensajes < ActiveRecord::Migration
  def change
    create_table :mensajes do |t|
      t.string  :comentario,                        :null => false, :default => ""
      t.string  :usuario,            :limit => 15,  :null => true,  :default => nil
      t.boolean :visto,                             :null => false, :default => false

      t.timestamps
    end
  end
end
