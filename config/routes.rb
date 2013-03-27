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
  scope :path_names => { :new => "nuevo", :edit => "editar" } do
    devise_for :proveedor, :class_name => 'Usuario', :controllers => { :registrations => "registrations", :confirmations => "confirmations" }, :path_names => { :sign_in => 'iniciar_sesion', :sign_up => 'registro', :sign_out => 'cerrar_sesion', :password => 'clave', :confirmation => 'verificacion', :edit => 'editar' }
    devise_for :solicitante, :class_name => 'Usuario', :controllers => { :registrations => "registrations", :confirmations => "confirmations" }, :path_names => { :sign_in => 'iniciar_sesion', :sign_up => 'registro', :sign_out => 'cerrar_sesion', :password => 'clave', :confirmation => 'verificacion', :edit => 'editar' }
    
    devise_scope :solicitante do
      put "/solicitante/verificacion" => "confirmations#confirm", :as => :solicitante_confirm
    end
      devise_scope :proveedor do
      put "/proveedor/verificacion" => "confirmations#confirm", :as => :proveedor_confirm
    end

    scope "/solicitante" do
      get     "/" => "solicitantes#panel", :as => "panel_solicitante"
      get     "nuevo-perfil" => "solicitantes#new", :as => "new_solicitante"
      get     "editar-perfil" => "solicitantes#edit", :as => "edit_solicitante"
#      post    "nuevo-perfil(.:id)" => "solicitantes#create", :as => "solicitantes"
#      put     "editar-perfil(.:id)" => "solicitantes#update", :as => "solicitante"
    end
    resources :solicitantes, :only => [:create, :update]
    
    scope "/proveedor" do
      get     "/" => "proveedores#panel", :as => "panel_proveedor"
      get     'categorias' => "proveedores#categorias_de_proveedor", :as => "categorias_de_proveedor"
      put     'categorias(/:id)' => "proveedores#update_categorias_de_proveedor", :as => "update_categorias_de_proveedor"
      get     "editar-perfil" => "proveedores#edit", :as => "edit_proveedor"
#      put     "editar-perfil(.:id)" => "proveedores#update", :as => "proveedores"
      get     "imagen" => "proveedores#imagen", :as => "imagen_proveedor"
      put     "imagen(/:id)" => "proveedores#cambiar_imagen", :as => "cambiar_imagen_proveedor"
      get     "imagenes_galeria" => "imagenes#galeria", :as => "galeria_proveedor"
      put     "imagenes_galeria(/:id)" => "imagenes#editar_galeria", :as => "editar_galeria_proveedor"
      delete  "imagenes_galeria(/:id)" => "imagenes#borrar_galeria", :as => "borrar_galeria_proveedor"
      get     "nuevo-perfil" => "proveedores#new", :as => "new_proveedor"
#      post    "nuevo-perfil(.:id)" => "proveedores#create", :as => "proveedores"
    end
    scope :proveedores do
      get     'proveedores/:filtro/:valor' => "proveedores#index", :as => "listar_proveedores", :constraints => FiltroListaProveedores
      get     "proveedores/:id" => "proveedores#show", :as => "perfil_proveedor"
    end
    resources :proveedores, :only => [:index, :show, :create, :update]
    
    scope :trabajos do
      get     'trabajos/:filtro/:valor' => "trabajos#index", :as => "listar_trabajos", :constraints => FiltroListaTrabajos
    end
    resources :trabajos, :shallow => true do
      member do
        match 'finalizar' => "trabajos#finalizar_trabajo", :via => [:put]
      end
      resources :presupuestos do
        member do
          match 'aceptar' => "presupuestos#aceptar_presupuesto", :via => [:put, :post]
          match 'rechazar' => "presupuestos#rechazar_presupuesto", :via => [:put, :post]
        end
        resources :mensajes # , :only => [:index, :create, :destroy]
      end
    end
    
    resources :categorias
  
    scope "/ubicaciones_geograficas" do
      get "get_lista_entidades" => "ubicaciones_geograficas#get_lista_entidades"
    end
    resources :ubicaciones_geograficas
    
    scope "/general" do
      get "contacto" => "general#home", :as => "general_contacto"
      get "home" => "general#home", :as => "general_home"
      get "terminos-y-condiciones" => "general#home", :as => "general_terminos"
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
  # match ':controller(/:action(/:id))(.:format)'
end