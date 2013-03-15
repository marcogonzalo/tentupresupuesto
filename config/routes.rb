Ttp::Application.routes.draw do
  get "general/home"

  devise_for :proveedor, :class_name => 'Usuario', :controllers => { :registrations => "registrations", :confirmations => "confirmations" }, :path_names => { :sign_in => 'iniciar_sesion', :sign_up => 'registro', :sign_out => 'cerrar_sesion', :password => 'clave', :confirmation => 'verificacion', :edit => 'editar' }
  devise_for :solicitante, :class_name => 'Usuario', :controllers => { :registrations => "registrations", :confirmations => "confirmations" }, :path_names => { :sign_in => 'iniciar_sesion', :sign_up => 'registro', :sign_out => 'cerrar_sesion', :password => 'clave', :confirmation => 'verificacion', :edit => 'editar' }
  devise_scope :solicitante do
    put "/solicitante/verificacion" => "confirmations#confirm", :as => :solicitante_confirm
  end
  
  scope "/solicitante" do
    get     "/" => "solicitantes#panel", :as => "panel_solicitante"
    get     "nuevo" => "solicitantes#new", :as => "new_solicitante"
    get     "editar" => "solicitantes#edit", :as => "edit_solicitante"
    post    "nuevo(.:id)" => "solicitantes#create", :as => "solicitantes"
    put     "editar(.:id)" => "solicitantes#update", :as => "solicitante"
  end
  
  devise_scope :proveedor do
    put "/proveedor/verificacion" => "confirmations#confirm", :as => :proveedor_confirm
  end
  
  scope "/proveedor" do
    get     "/" => "proveedores#panel", :as => "panel_proveedor"
    get     'categorias' => "proveedores#categorias_de_proveedor", :as => "categorias_de_proveedor"
    put     'categorias' => "proveedores#update_categorias_de_proveedor", :as => "update_categorias_de_proveedor"
    get     "editar" => "proveedores#edit", :as => "edit_proveedor"
    put     "editar(.:id)" => "proveedores#update", :as => "proveedores"
    get     "imagen" => "proveedores#imagen", :as => "imagen_proveedor"
    put     "imagen/:id" => "proveedores#cambiar_imagen", :as => "cambiar_imagen_proveedor"
    get     "nuevo" => "proveedores#new", :as => "new_proveedor"
    post    "nuevo(.:id)" => "proveedores#create", :as => "proveedores"
  end

  resources :proveedores, :only => [:index, :show, :create, :update]
  scope :proveedores do
    get     "proveedores/:id" => "proveedores#show", :as => "perfil_proveedor"
  end
  
  resources :trabajos, :shallow => true, :path_names => {:new => "nuevo", :edit => "editar"} do
    resources :presupuestos, :path_names => {:new => "nuevo", :edit => "editar"} do
      member do
        put 'aceptar' => "presupuestos#aceptar_presupuesto"
        put 'rechazar' => "presupuestos#rechazar_presupuesto"
      end
      resources :mensajes # , :only => [:index, :create, :destroy]
    end
  end
  
  resources :categorias

  scope "/ubicaciones_geograficas" do
    get "get_lista_entidades" => "ubicaciones_geograficas#get_lista_entidades"
  end
  resources :ubicaciones_geograficas
  
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
