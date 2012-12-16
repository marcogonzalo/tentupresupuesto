class CreateMensajes < ActiveRecord::Migration
  def change
    create_table :mensajes, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string :comentario,                     :null => false, :default => ""
      t.enum :usuario,            :limit => [:solicitante,:proveedor], :null => true, :default => nil
      t.boolean :visto,                         :null => false, :default => false

      t.timestamps
    end
  end
end
