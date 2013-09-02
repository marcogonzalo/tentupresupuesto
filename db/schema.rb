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

ActiveRecord::Schema.define(:version => 20130812021012) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.boolean  "aprobado",               :default => false, :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "admins", ["aprobado"], :name => "index_admins_on_aprobado"
  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "categorias", :force => true do |t|
    t.string  "nombre",                :limit => 50, :default => "",   :null => false
    t.string  "descripcion"
    t.integer "padre_id",                            :default => 0
    t.string  "slug",                                :default => "",   :null => false
    t.integer "proveedores_asociados",               :default => 0,    :null => false
    t.integer "trabajos_asociados",                  :default => 0,    :null => false
    t.boolean "visible",                             :default => true, :null => false
    t.string  "clase_css",                           :default => "",   :null => false
  end

  add_index "categorias", ["padre_id"], :name => "index_categorias_on_padre_id"
  add_index "categorias", ["slug"], :name => "index_categorias_on_slug"

  create_table "categorias_proveedores", :id => false, :force => true do |t|
    t.integer "categoria_id"
    t.integer "proveedor_id"
  end

  add_index "categorias_proveedores", ["categoria_id", "proveedor_id"], :name => "index_categorias_proveedores_on_categoria_id_and_proveedor_id", :unique => true
  add_index "categorias_proveedores", ["proveedor_id", "categoria_id"], :name => "index_categorias_proveedores_on_proveedor_id_and_categoria_id", :unique => true

  create_table "evaluaciones", :force => true do |t|
    t.integer  "trabajo_id",                           :null => false
    t.integer  "proveedor_id",                         :null => false
    t.float    "total",               :default => 0.0, :null => false
    t.float    "atencion"
    t.float    "calidad"
    t.float    "limpieza"
    t.float    "precio"
    t.float    "responsabilidad"
    t.float    "tiempo"
    t.string   "observaciones",       :default => "",  :null => false
    t.string   "respuesta_proveedor", :default => "",  :null => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "evaluaciones", ["proveedor_id"], :name => "index_evaluaciones_on_proveedor_id"
  add_index "evaluaciones", ["trabajo_id"], :name => "index_evaluaciones_on_trabajo_id", :unique => true

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "imagenes", :force => true do |t|
    t.string   "archivo",                       :null => false
    t.string   "descripcion"
    t.string   "proposito",       :limit => 20
    t.integer  "imagenable_id",                 :null => false
    t.string   "imagenable_type",               :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "imagenes", ["imagenable_type", "imagenable_id", "proposito"], :name => "index_imagenes_on_imtype_imid_proposito"
  add_index "imagenes", ["imagenable_type", "imagenable_id"], :name => "index_imagenes_on_imtype_imid"

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
    t.float    "precio_minimo",                :default => 0.0,     :null => false
    t.float    "precio_maximo",                :default => 0.0,     :null => false
    t.text     "resumen",                      :default => "",      :null => false
    t.boolean  "con_iva",                      :default => true,    :null => false
    t.boolean  "visto",                        :default => false,   :null => false
    t.boolean  "aprobado"
    t.boolean  "rechazado",                    :default => false,   :null => false
    t.string   "motivo_rechazo", :limit => 20
    t.integer  "cant_mensajes",                :default => 0,       :null => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.integer  "trabajo_id"
    t.integer  "proveedor_id"
    t.boolean  "enviar_datos",                 :default => false
    t.string   "unidad",                       :default => "total"
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
    t.integer  "pais_id"
    t.integer  "estado_id"
    t.integer  "municipio_id"
    t.integer  "localidad_id"
    t.string   "avatar"
    t.string   "web_url"
    t.string   "twitter_url"
    t.string   "facebook_url"
    t.string   "google_url"
    t.string   "linkedin_url"
    t.string   "youtube_url"
    t.string   "pinterest_url"
    t.string   "instagram_url"
  end

  add_index "proveedores", ["avatar"], :name => "index_proveedores_on_avatar"
  add_index "proveedores", ["estado_id"], :name => "index_proveedores_on_estado_id"
  add_index "proveedores", ["localidad_id"], :name => "index_proveedores_on_localidad_id"
  add_index "proveedores", ["municipio_id"], :name => "index_proveedores_on_municipio_id"
  add_index "proveedores", ["pais_id"], :name => "index_proveedores_on_pais_id"
  add_index "proveedores", ["rif"], :name => "index_proveedores_on_rif", :unique => true
  add_index "proveedores", ["slug"], :name => "index_proveedores_on_slug", :unique => true

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "solicitantes", :force => true do |t|
    t.string   "cedula",                 :limit => 20, :default => "", :null => false
    t.string   "telefono_local",         :limit => 20, :default => ""
    t.string   "telefono_movil",         :limit => 20, :default => ""
    t.string   "telefono_alt",           :limit => 20, :default => ""
    t.string   "direccion",                            :default => ""
    t.string   "punto_referencia",       :limit => 50, :default => ""
    t.integer  "solicitudes_realizadas",               :default => 0,  :null => false
    t.integer  "trabajos_recibidos",                   :default => 0,  :null => false
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.integer  "pais_id"
    t.integer  "estado_id"
    t.integer  "municipio_id"
    t.integer  "localidad_id"
  end

  add_index "solicitantes", ["estado_id"], :name => "index_solicitantes_on_estado_id"
  add_index "solicitantes", ["localidad_id"], :name => "index_solicitantes_on_localidad_id"
  add_index "solicitantes", ["municipio_id"], :name => "index_solicitantes_on_municipio_id"
  add_index "solicitantes", ["pais_id"], :name => "index_solicitantes_on_pais_id"

  create_table "trabajos", :force => true do |t|
    t.string   "proposito",         :limit => 100,                               :default => "",            :null => false
    t.text     "descripcion",                                                    :default => "",            :null => false
    t.string   "estatus",           :limit => 15,                                :default => "buscando",    :null => false
    t.text     "direccion",                                                      :default => "",            :null => false
    t.decimal  "precio_final",                     :precision => 8, :scale => 2, :default => 0.0,           :null => false
    t.integer  "cant_presupuestos",                                              :default => 0,             :null => false
    t.datetime "created_at",                                                                                :null => false
    t.datetime "updated_at",                                                                                :null => false
    t.integer  "solicitante_id"
    t.integer  "contratado_id"
    t.string   "slug",                                                           :default => "",            :null => false
    t.integer  "categoria_id"
    t.integer  "pais_id"
    t.integer  "estado_id"
    t.integer  "municipio_id"
    t.integer  "localidad_id"
    t.string   "intencion",                                                      :default => "averiguando"
  end

  add_index "trabajos", ["categoria_id"], :name => "index_trabajos_on_categoria_id"
  add_index "trabajos", ["contratado_id"], :name => "index_trabajos_on_contratado_id"
  add_index "trabajos", ["estado_id"], :name => "index_trabajos_on_estado_id"
  add_index "trabajos", ["estatus"], :name => "index_trabajos_on_estatus"
  add_index "trabajos", ["localidad_id"], :name => "index_trabajos_on_localidad_id"
  add_index "trabajos", ["municipio_id"], :name => "index_trabajos_on_municipio_id"
  add_index "trabajos", ["pais_id"], :name => "index_trabajos_on_pais_id"
  add_index "trabajos", ["slug"], :name => "index_trabajos_on_slug", :unique => true
  add_index "trabajos", ["solicitante_id"], :name => "index_trabajos_on_solicitante_id"

  create_table "ubicaciones_geograficas", :force => true do |t|
    t.string  "nombre",     :limit => 100,                     :null => false
    t.string  "tipo",       :limit => 15,  :default => "pais", :null => false
    t.integer "entidad_id"
    t.string  "slug",                      :default => "",     :null => false
  end

  add_index "ubicaciones_geograficas", ["entidad_id"], :name => "index_ubicaciones_geograficas_on_entidad_id"
  add_index "ubicaciones_geograficas", ["nombre", "tipo", "entidad_id"], :name => "index_ubicaciones_geograficas_on_nombre_and_tipo_and_entidad_id", :unique => true
  add_index "ubicaciones_geograficas", ["slug"], :name => "index_ubicaciones_geograficas_on_slug", :unique => true

  create_table "usuarios", :force => true do |t|
    t.string   "email",                                :default => "",    :null => false
    t.string   "encrypted_password",                   :default => "",    :null => false
    t.integer  "perfilable_id"
    t.string   "perfilable_type"
    t.string   "password_salt"
    t.string   "nombre",                 :limit => 50, :default => "",    :null => false
    t.string   "sexo",                   :limit => 10
    t.date     "fecha_nacimiento"
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
  add_index "usuarios", ["perfilable_id"], :name => "index_usuarios_on_perfilable_id"
  add_index "usuarios", ["perfilable_type"], :name => "index_usuarios_on_perfilable_type"
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true

  add_foreign_key "evaluaciones", "proveedores", :name => "evaluaciones_proveedor_id_fk", :dependent => :delete
  add_foreign_key "evaluaciones", "trabajos", :name => "evaluaciones_trabajo_id_fk"

  add_foreign_key "mensajes", "presupuestos", :name => "mensajes_presupuesto_id_fk", :dependent => :delete

  add_foreign_key "presupuestos", "proveedores", :name => "presupuestos_proveedor_id_fk", :dependent => :delete
  add_foreign_key "presupuestos", "trabajos", :name => "presupuestos_trabajo_id_fk", :dependent => :delete

  add_foreign_key "proveedores", "ubicaciones_geograficas", :name => "proveedores_estado_id_fk", :column => "estado_id"
  add_foreign_key "proveedores", "ubicaciones_geograficas", :name => "proveedores_localidad_id_fk", :column => "localidad_id"
  add_foreign_key "proveedores", "ubicaciones_geograficas", :name => "proveedores_municipio_id_fk", :column => "municipio_id"
  add_foreign_key "proveedores", "ubicaciones_geograficas", :name => "proveedores_pais_id_fk", :column => "pais_id"

  add_foreign_key "solicitantes", "ubicaciones_geograficas", :name => "solicitantes_estado_id_fk", :column => "estado_id"
  add_foreign_key "solicitantes", "ubicaciones_geograficas", :name => "solicitantes_localidad_id_fk", :column => "localidad_id"
  add_foreign_key "solicitantes", "ubicaciones_geograficas", :name => "solicitantes_municipio_id_fk", :column => "municipio_id"
  add_foreign_key "solicitantes", "ubicaciones_geograficas", :name => "solicitantes_pais_id_fk", :column => "pais_id"

  add_foreign_key "trabajos", "categorias", :name => "trabajos_categoria_id_fk"
  add_foreign_key "trabajos", "proveedores", :name => "trabajos_contratado_id_fk", :column => "contratado_id"
  add_foreign_key "trabajos", "solicitantes", :name => "trabajos_solicitante_id_fk"
  add_foreign_key "trabajos", "ubicaciones_geograficas", :name => "trabajos_estado_id_fk", :column => "estado_id"
  add_foreign_key "trabajos", "ubicaciones_geograficas", :name => "trabajos_localidad_id_fk", :column => "localidad_id"
  add_foreign_key "trabajos", "ubicaciones_geograficas", :name => "trabajos_municipio_id_fk", :column => "municipio_id"
  add_foreign_key "trabajos", "ubicaciones_geograficas", :name => "trabajos_pais_id_fk", :column => "pais_id"

end
