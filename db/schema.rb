# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121118203908) do

  create_table "proveedores", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "solicitantes", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "usuarios", :force => true do |t|
    t.string   "email",                                               :default => "",    :null => false
    t.string   "encrypted_password",                                  :default => "",    :null => false
    t.integer  "perfilable_id"
    t.string   "perfilable_type"
    t.string   "nombre",                 :limit => 50,                :default => "",    :null => false
    t.string   "apellido",               :limit => 50,                :default => "",    :null => false
    t.enum     "sexo",                   :limit => [:hombre, :mujer]
    t.date     "fecha_nacimiento"
    t.string   "telefono_local",         :limit => 20,                :default => "",    :null => false
    t.string   "telefono_movil",         :limit => 20,                :default => "",    :null => false
    t.string   "telefono_alt",           :limit => 20,                :default => ""
    t.boolean  "activo",                                              :default => true,  :null => false
    t.boolean  "acepta_terminos",                                     :default => false, :null => false
    t.datetime "ultimo_pago"
    t.boolean  "notificaciones",                                      :default => false, :null => false
    t.string   "plan_beneficio"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "password_salt"
    t.integer  "sign_in_count",                                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "authentication_token"
    t.datetime "created_at",                                                             :null => false
    t.datetime "updated_at",                                                             :null => false
  end

  add_index "usuarios", ["authentication_token"], :name => "index_usuarios_on_authentication_token", :unique => true
  add_index "usuarios", ["confirmation_token"], :name => "index_usuarios_on_confirmation_token", :unique => true
  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true

end
