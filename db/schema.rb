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

ActiveRecord::Schema.define(:version => 20130106233647) do

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "mensajes", :force => true do |t|
    t.string   "comentario",                   :default => "",    :null => false
    t.string   "usuario",        :limit => 15
    t.boolean  "visto",                        :default => false, :null => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.integer  "presupuesto_id"
  end

  add_index "mensajes", ["presupuesto_id"], :name => "index_mensajes_on_presupuesto_id"

  create_table "presupuestos", :force => true do |t|
    t.float    "precio_minimo",                :default => 0.0,   :null => false
    t.float    "precio_maximo",                :default => 0.0,   :null => false
    t.text     "resumen",                      :default => "",    :null => false
    t.boolean  "con_iva",                      :default => true,  :null => false
    t.boolean  "visto",                        :default => false, :null => false
    t.boolean  "aprobado"
    t.boolean  "rechazado",                    :default => false, :null => false
    t.string   "motivo_rechazo", :limit => 20
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.integer  "trabajo_id"
    t.integer  "proveedor_id"
  end

  add_index "presupuestos", ["proveedor_id"], :name => "index_presupuestos_on_proveedor_id"
  add_index "presupuestos", ["trabajo_id"], :name => "index_presupuestos_on_trabajo_id"

  create_table "proveedores", :force => true do |t|
    t.string   "nombre_empresa",        :limit => 50, :default => "",              :null => false
    t.string   "tipo_proveedor",        :limit => 30, :default => "independiente", :null => false
    t.string   "rif",                   :limit => 20, :default => ""
    t.text     "descripcion",                         :default => "",              :null => false
    t.boolean  "verificado",                          :default => false,           :null => false
    t.string   "telefono_local",        :limit => 20, :default => "",              :null => false
    t.string   "telefono_movil",        :limit => 20, :default => "",              :null => false
    t.string   "telefono_alt",          :limit => 20, :default => "",              :null => false
    t.string   "direccion",                           :default => ""
    t.string   "punto_referencia",      :limit => 50, :default => ""
    t.integer  "solicitudes_atendidas",               :default => 0,               :null => false
    t.integer  "trabajos_realizados",                 :default => 0,               :null => false
    t.float    "reputacion",                          :default => 0.0,             :null => false
    t.integer  "valoraciones",                        :default => 0,               :null => false
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
    t.string   "slug",                                :default => "",              :null => false
  end

  add_index "proveedores", ["rif"], :name => "index_proveedores_on_rif", :unique => true
  add_index "proveedores", ["slug"], :name => "index_proveedores_on_slug", :unique => true

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
    t.string   "proposito",      :limit => 100,                               :default => "",         :null => false
    t.text     "descripcion",                                                 :default => "",         :null => false
    t.string   "estatus",        :limit => 15,                                :default => "buscando", :null => false
    t.text     "direccion",                                                   :default => "",         :null => false
    t.decimal  "precio_final",                  :precision => 8, :scale => 2, :default => 0.0,        :null => false
    t.datetime "created_at",                                                                          :null => false
    t.datetime "updated_at",                                                                          :null => false
    t.integer  "solicitante_id"
    t.integer  "contratado_id"
    t.string   "slug",                                                        :default => "",         :null => false
  end

  add_index "trabajos", ["contratado_id"], :name => "index_trabajos_on_contratado_id"
  add_index "trabajos", ["estatus"], :name => "index_trabajos_on_estatus"
  add_index "trabajos", ["slug"], :name => "index_trabajos_on_slug", :unique => true
  add_index "trabajos", ["solicitante_id"], :name => "index_trabajos_on_solicitante_id"

  create_table "usuarios", :force => true do |t|
    t.string   "email",                                :default => "",    :null => false
    t.string   "encrypted_password",                   :default => "",    :null => false
    t.integer  "perfilable_id"
    t.string   "perfilable_type"
    t.string   "password_salt"
    t.string   "nombre",                 :limit => 50, :default => "",    :null => false
    t.string   "apellido",               :limit => 50, :default => "",    :null => false
    t.string   "sexo",                   :limit => 10
    t.date     "fecha_nacimiento"
    t.string   "telefono_local",         :limit => 20, :default => ""
    t.string   "telefono_movil",         :limit => 20, :default => ""
    t.string   "telefono_alt",           :limit => 20, :default => ""
    t.boolean  "activo",                               :default => true,  :null => false
    t.boolean  "acepta_terminos",                      :default => false, :null => false
    t.datetime "ultimo_pago"
    t.boolean  "notificaciones",                       :default => false, :null => false
    t.string   "plan_beneficio"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "authentication_token"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
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
