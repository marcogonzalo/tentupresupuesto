class FiltroListaProveedores
  FILTROS = %w[categoria tipo ubicacion]
  def self.matches?(request)
    FILTROS.include? request.params[:filtro]
  end
end
class FiltroListaTrabajos
  FILTROS = %w[categoria estatus ubicacion]
  def self.matches?(request)
    FILTROS.include? request.params[:filtro]
  end
end

Ttp::Application.routes.draw do
  mount RailsAdmin::Engine => '/agapitear', :as => 'rails_admin'

  scope :path_names => { :new => "nuevo", :edit => "editar" } do
    scope :path_names => { :sign_in => 'iniciar_sesion', :sign_up => 'registro', :sign_out => 'cerrar_sesion', :password => 'clave', :confirmation => 'verificacion', :edit => 'editar' } do
      devise_for :admins
      devise_for :proveedor, :class_name => 'Usuario', :controllers => { :registrations => "registrations"}
      devise_for :solicitante, :class_name => 'Usuario', :controllers => { :registrations => "registrations"}
    end

    devise_scope :solicitante do
      put "/solicitante/verificacion" => "confirmations#confirm", :as => :solicitante_confirm
    end
    devise_scope :proveedor do
      put "/proveedor/verificacion" => "confirmations#confirm", :as => :proveedor_confirm
    end

    scope "/solicitante" do
      get     "nuevo-perfil" => "solicitantes#new", :as => "new_solicitante"
      get     "editar-perfil" => "solicitantes#edit", :as => "edit_solicitante"
      get     "no-soy-solicitante" => "solicitantes#no_soy_solicitante", :as => "no_soy_solicitante"
      get     "/" => "solicitantes#panel", :as => "panel_solicitante"
    end
    resources :solicitantes, :only => [:create, :update]
    
    scope "/proveedor" do
      get     "nuevo-perfil" => "proveedores#new", :as => "new_proveedor"
      get     "editar-perfil" => "proveedores#edit", :as => "edit_proveedor"
      get     "no-soy-proveedor" => "proveedores#no_soy_proveedor", :as => "no_soy_proveedor"
      get     'categorias' => "proveedores#categorias_de_proveedor", :as => "categorias_de_proveedor"
      put     'categorias(/:id)' => "proveedores#update_categorias_de_proveedor", :as => "update_categorias_de_proveedor"
      get     'ubicaciones' => "proveedores#ubicaciones_de_proveedor", :as => "ubicaciones_de_proveedor"
      put     'ubicaciones(/:id)' => "proveedores#update_ubicaciones_de_proveedor", :as => "update_ubicaciones_de_proveedor"
      get     'enlaces' => "proveedores#enlaces_de_proveedor", :as => "enlaces_de_proveedor"
      put     'enlaces(/:id)' => "proveedores#update_enlaces_de_proveedor", :as => "enlaces_de_proveedor"
      get     "imagen" => "proveedores#imagen", :as => "imagen_proveedor"
      put     "imagen(/:id)" => "proveedores#cambiar_imagen", :as => "cambiar_imagen_proveedor"
      get     "imagenes_galeria" => "imagenes#galeria", :as => "galeria_proveedor"
      put     "imagenes_galeria(/:id)" => "imagenes#editar_galeria", :as => "editar_galeria_proveedor"
      delete  "imagenes_galeria(/:id)" => "imagenes#borrar_galeria", :as => "borrar_galeria_proveedor"
      get     "/" => "proveedores#panel", :as => "panel_proveedor"
    end
    scope :proveedores do
      get     'proveedores/:filtro/:valor' => "proveedores#index", :as => "listar_proveedores", :constraints => FiltroListaProveedores
      get     "proveedores/:id" => "proveedores#show", :as => "perfil_proveedor"
    end
    resources :proveedores, :only => [:index, :show, :create, :update]
    
    scope :trabajos do
      get     'trabajos/:filtro/:valor' => "trabajos#index", :as => "listar_trabajos", :constraints => FiltroListaTrabajos
    end
    resources :trabajos do
      member do
        match 'abrir' => "trabajos#abrir_trabajo", :via => [:put, :post]
        match 'cerrar' => "trabajos#cerrar_trabajo", :via => [:put, :post]
        match 'finalizar' => "trabajos#finalizar_trabajo", :via => [:put]
      end
      resources :presupuestos, :shallow => true do
        member do
          match 'aceptar' => "presupuestos#aceptar_presupuesto", :via => [:put, :post]
          match 'rechazar' => "presupuestos#rechazar_presupuesto", :via => [:put, :post]
          match 'enviar_datos' => "presupuestos#datos_de_solicitante_a_proveedor", :via => [:put, :post]
        end
        resources :mensajes, :shallow => true # , :only => [:index, :create, :destroy]
      end
      resources :evaluaciones, :except => [:index, :show, :edit, :destroy], :path => "/", :path_names => { :new => "evaluar" }
    end
    
    resources :categorias do
      get     ":que" => "categorias#reset", :as => "reset_en_categorias"
    end
  
    scope "/ubicaciones_geograficas" do
      get "get_lista_entidades" => "ubicaciones_geograficas#get_lista_entidades"
    end
    resources :ubicaciones_geograficas
    
    scope "/general" do
      get "contacto" => "general#home", :as => "general_contacto"
      get "consejos_proveedor" => "general#consejos_proveedor", :as => "consejos_proveedor"
      get "consejos_solicitante" => "general#consejos_solicitante", :as => "consejos_solicitante"
      get "home" => "general#home", :as => "general_home"
      get "terminos-y-condiciones" => "general#tyc", :as => "general_tyc"
    end
   
  end
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'general#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
