class DeviseCreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""
      
      ## Polymorphism
      t.references :perfilable, :polymorphic => true
      
      ## Encryptable
      t.string :password_salt
      
      ## Atributos adicionales
      t.string    :nombre,            :limit => 50, :null => false, :default => ""
      t.string    :apellido,          :limit => 50, :null => false, :default => ""
      t.string    :sexo,              :limit => 10, :null => true,  :default => nil
      t.date      :fecha_nacimiento,                :null => true,  :default => '0000-00-00'
      t.string    :telefono_local,    :limit => 20, :null => true,  :default => ""
      t.string    :telefono_movil,    :limit => 20, :null => true,  :default => ""
      t.string    :telefono_alt,      :limit => 20, :null => true,  :default => ""
      t.boolean   :activo,                          :null => false, :default => true
      t.boolean   :acepta_terminos,                 :null => false, :default => false
      t.datetime  :ultimo_pago,                     :null => true
      t.boolean   :notificaciones,                  :null => false, :default => false
      t.string    :plan_beneficio,                  :null => true

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Lockable
      # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Token authenticatable
      t.string :authentication_token


      t.timestamps
    end

    add_index :usuarios, :email,                :unique => true
    add_index :usuarios, :reset_password_token, :unique => true
    add_index :usuarios, :confirmation_token,   :unique => true
    # add_index :usuarios, :unlock_token,         :unique => true
    add_index :usuarios, :authentication_token, :unique => true
  end
end
