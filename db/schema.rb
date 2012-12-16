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

ActiveRecord::Schema.define(:version => 20121215015719) do

  create_table "mensajes", :force => true do |t|
    t.string   "comentario",                                           :default => "",    :null => false
    t.enum     "usuario",        :limit => [:solicitante, :proveedor]
    t.boolean  "visto",                                                :default => false, :null => false
    t.datetime "created_at",                                                              :null => false
    t.datetime "updated_at",                                                              :null => false
    t.integer  "presupuesto_id"
  end

  add_index "mensajes", ["presupuesto_id"], :name => "index_mensajes_on_presupuesto_id"

  create_table "presupuestos", :force => true do |t|
    t.float    "precio_minimo",                                                                                           :default => 0.0,   :null => false
    t.float    "precio_maximo",                                                                                           :default => 0.0,   :null => false
    t.text     "resumen",                                                                                                                    :null => false
    t.boolean  "con_iva",                                                                                                 :default => true,  :null => false
    t.boolean  "visto",                                                                                                   :default => false, :null => false
    t.boolean  "aprobado"
    t.boolean  "rechazado"
    t.enum     "motivo_rechazo", :limit => [:muy_caro, :muy_barato, :no_confiable, :pocos_detalles, :no_responde, :otro]
    t.datetime "created_at",                                                                                                                 :null => false
    t.datetime "updated_at",                                                                                                                 :null => false
    t.integer  "trabajo_id"
    t.integer  "proveedor_id"
  end

  add_index "presupuestos", ["proveedor_id"], :name => "index_presupuestos_on_proveedor_id"
  add_index "presupuestos", ["trabajo_id"], :name => "index_presupuestos_on_trabajo_id"

  create_table "proveedores", :force => true do |t|
    t.string   "nombre_empresa",        :limit => 50,                                                                           :default => "",             :null => false
    t.enum     "tipo_proveedor",        :limit => [:independiente, :cooperativa, :empresa_produccion_social, :empresa_privada], :default => :independiente
    t.string   "rif",                   :limit => 20,                                                                           :default => ""
    t.text     "descripcion",                                                                                                                               :null => false
    t.boolean  "verificado",                                                                                                    :default => false,          :null => false
    t.string   "telefono_local",        :limit => 20,                                                                           :default => "",             :null => false
    t.string   "telefono_movil",        :limit => 20,                                                                           :default => "",             :null => false
    t.string   "telefono_alt",          :limit => 20,                                                                           :default => "",             :null => false
    t.string   "direccion",                                                                                                     :default => ""
    t.string   "punto_referencia",      :limit => 50,                                                                           :default => ""
    t.integer  "solicitudes_atendidas",                                                                                         :default => 0,              :null => false
    t.integer  "trabajos_realizados",                                                                                           :default => 0,              :null => false
    t.float    "reputacion",                                                                                                    :default => 0.0,            :null => false
    t.integer  "valoraciones",                                                                                                  :default => 0,              :null => false
    t.datetime "created_at",                                                                                                                                :null => false
    t.datetime "updated_at",                                                                                                                                :null => false
  end

  create_table "solicitantes", :force => true do |t|
    t.string   "cedula",                 :limit => 20, :default => "", :null => false
    t.string   "direccion",                            :default => ""
    t.string   "punto_referencia",       :limit => 50, :default => ""
    t.integer  "solicitudes_realizadas",               :default => 0,  :null => false
    t.integer  "trabajos_recibidos",                   :default => 0,  :null => false
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  add_index "solicitantes", ["cedula"], :name => "index_solicitantes_on_cedula", :unique => true

  create_table "trabajos", :force => true do |t|
    t.string   "proposito",      :limit => 100,                                                                             :default => "",        :null => false
    t.text     "descripcion",                                                                                                                      :null => false
    t.enum     "estatus",        :limit => [:buscando, :ejecutando, :finalizado, :cancelado],                               :default => :buscando
    t.text     "direccion",                                                                                                                        :null => false
    t.decimal  "precio_final",                                                                :precision => 8, :scale => 2, :default => 0.0,       :null => false
    t.datetime "created_at",                                                                                                                       :null => false
    t.datetime "updated_at",                                                                                                                       :null => false
    t.integer  "solicitante_id"
    t.integer  "contratado_id"
  end

  add_index "trabajos", ["contratado_id"], :name => "index_trabajos_on_contratado_id"
  add_index "trabajos", ["solicitante_id"], :name => "index_trabajos_on_solicitante_id"

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

  add_foreign_key "mensajes", "presupuestos", :name => "mensajes_presupuesto_id_fk", :dependent => :delete

  add_foreign_key "presupuestos", "proveedores", :name => "presupuestos_proveedor_id_fk", :dependent => :delete
  add_foreign_key "presupuestos", "trabajos", :name => "presupuestos_trabajo_id_fk", :dependent => :delete

  add_foreign_key "trabajos", "proveedores", :name => "trabajos_contratado_id_fk", :column => "contratado_id"
  add_foreign_key "trabajos", "solicitantes", :name => "trabajos_solicitante_id_fk"

end
