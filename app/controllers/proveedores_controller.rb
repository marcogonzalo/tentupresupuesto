# coding: utf-8
class ProveedoresController < ApplicationController
  before_filter :no_authenticated, :only => [:new, :create]
  before_filter :authenticated_proveedor, :except => [:index, :show]

################  
######## VISTAS
################

  # GET /proveedores
  # GET /proveedores.json
  def index
    unless params[:filtro].nil?
      @proveedores = []
      if FiltroListaProveedores::FILTROS.include?(params[:filtro]) and not params[:valor].nil?
        case params[:filtro]
        when "categoria"
          @categoria = Categoria.find(params[:valor])
          @proveedores =  @categoria.nil? ? [] : @categoria.proveedores
        when "tipo"
          existe_tipo = Proveedor::TIPO_EMPRESA.include?(params[:valor])
          @tipo = Proveedor::TIPO_EMPRESA.include?(params[:valor]) ? params[:valor].to_s : nil
          @proveedores = existe_tipo ? Proveedor.where(:tipo_proveedor => params[:valor]) : []
        when "ubicacion"
          @ubicacion = UbicacionGeografica.find(params[:valor])
          unless @ubicacion.nil?
            case @ubicacion.tipo
            when 'pais'
              @proveedores = @ubicacion.proveedores_de_pais
            when 'estado'
              @proveedores = @ubicacion.proveedores_de_estado
            when 'municipio'
              @proveedores = @ubicacion.proveedores_de_municipio
            when 'localidad'
              @proveedores = @ubicacion.proveedores_de_localidad
            end
          end
        end
      end
    else
      @proveedores = Proveedor.all
    end
    @cant_resultados = @proveedores.size
    add_breadcrumb :index, :proveedores_path
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @proveedores }
    end
  end

  # GET /proveedores/1
  # GET /proveedores/1.json
  def show
    @proveedor = Proveedor.find(params[:id])
    @imagenes = @proveedor.imagenes
    if request.path != proveedor_path(@proveedor)
      redirect_to @proveedor, status: :moved_permanently
    else
      add_breadcrumb :index, :proveedores_path
      add_breadcrumb @proveedor.nombre_empresa
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @proveedor }
      end
    end
  end

  # GET /proveedor/nuevo
  # GET /proveedores/new.json
  def new
    @proveedor = Proveedor.new
    @localidad = ""
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proveedor }
    end
  end

  # GET /proveedor/editar
  def edit
    @proveedor = Proveedor.find(current_proveedor.perfilable_id)
    @localidad = @proveedor.localidad ? @proveedor.localidad.nombre : ""
  end

  # GET /proveedor/cambiar-imagen
  def imagen
    @proveedor = Proveedor.find(current_proveedor.perfilable_id)
    render "imagen_perfil"
  end

  # GET /proveedor
  def panel
    @presupuestos_presentados = Presupuesto.includes([:trabajo, :mensajes]).where("presupuestos.proveedor_id = ? AND trabajos.estatus = 'buscando'", current_proveedor.perfilable_id).order("trabajos.updated_at DESC")
    @trabajos_asignados = Presupuesto.includes([:trabajo, :mensajes]).where("presupuestos.proveedor_id = ? AND trabajos.estatus = 'ejecutando'", current_proveedor.perfilable_id).order("trabajos.updated_at DESC")
    @por_evaluar = Presupuesto.includes([:trabajo, :mensajes]).where("presupuestos.proveedor_id = ? AND trabajos.estatus = 'finalizado'", current_proveedor.perfilable_id).order("trabajos.updated_at DESC") # Trabajo.includes(:presupuestos).where(:contratado_id => current_proveedor.perfilable_id).estatus_finalizado

    render "panel"
  end
  
  # GET /proveedor/categorias
  def categorias_de_proveedor
    @proveedor = Proveedor.find(current_proveedor.perfilable_id)
    render "categorias"
  end

################  
######## ACCIONES
################

  # POST /proveedores
  # POST /proveedores.json
  def create
    params[:proveedor][:pais_id] = 1 # Venezuela
    @localidad = ""
    unless params[:proveedor][:localidad_id].empty?
      params[:proveedor][:localidad_id] = UbicacionGeografica.buscar_o_crear_id_de_entidad(params[:proveedor][:localidad_id],'localidad',params[:proveedor][:municipio_id])
    end
    @proveedor = Proveedor.new(params[:proveedor])
    
    respond_to do |format|
      if proveedor_signed_in?
        if current_proveedor.perfilable_id.nil? or current_proveedor.perfilable_id <= 0
          if @proveedor.save
            current_proveedor.update_attribute('perfilable_id', @proveedor.id)
            
            flash[:success] = "Datos de proveedor registrados."
            format.html { redirect_to categorias_de_proveedor_path }
            format.json { render json: @proveedor, status: :created, location: @proveedor }
          else
            flash[:error] = "Ocurrió un error. Revisa el formulario."
            format.html { render action: "new" }
            format.json { render json: @proveedor.errors, status: :unprocessable_entity }
          end
        else
          flash[:warning] = 'Ya posee un perfil asociado.'
          format.html { render action: "new"  }
          format.json { render json: @proveedor.errors, status: :unprocessable_entity }
        end 
      else
        flash[:info] = 'No ha iniciado sesión.'
        format.html { redirect_to new_proveedor_session }
        format.json { render json: @proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /proveedores/1
  # PUT /proveedores/1.json
  def update
    @proveedor = Proveedor.find(current_proveedor.perfilable_id)
    
    params[:proveedor][:pais_id] = 1 # Venezuela
    @localidad = ""
    unless params[:proveedor][:localidad_id].empty?
      @localidad = params[:proveedor][:localidad_id]
      params[:proveedor][:localidad_id] = UbicacionGeografica.buscar_o_crear_id_de_entidad(params[:proveedor][:localidad_id],'localidad',params[:proveedor][:municipio_id])
    end
    
    respond_to do |format|
      if @proveedor.update_attributes(params[:proveedor])
        flash[:success] = "Perfil actualizado."
        format.html { redirect_to panel_proveedor_path }
        format.json { head :no_content }
      else
        flash[:error] = "Ocurrió un error. Revisa el formulario."
        format.html { render action: "edit" }
        format.json { render json: @proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proveedores/1
  # DELETE /proveedores/1.json
  def destroy
    @proveedor = Proveedor.find(params[:id])
    @proveedor.destroy

    respond_to do |format|
      flash[:success] = "Proveedor eliminado."
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  def cambiar_imagen
    @proveedor = Proveedor.find(current_proveedor.perfilable_id)
    @proveedor.avatar = params[:proveedor][:avatar]
    #@proveedor.avatar = File.open('somewhere')
    #@proveedor.avatar.url # => '/url/to/file.png'
    #@proveedor.avatar.current_path # => 'path/to/file.png'
    #@proveedor.avatar.identifier # => 'file.png'
    respond_to do |format|
      if proveedor_signed_in?
        unless current_proveedor.perfilable_id.nil? or current_proveedor.perfilable_id <= 0
          if @proveedor.save
            flash[:success] = "Imagen de perfil modificada."
            format.html { redirect_to panel_proveedor_path } #render action: "imagen_perfil" }
            format.json { render json: @proveedor, status: :created, location: @proveedor }
          else
            flash[:error] = "Ocurrió un error al modificar la imagen."
            format.html { render action: "imagen_perfil" }
            format.json { render json: @proveedor.errors, status: :unprocessable_entity }
          end
        else
          flash[:warning] = 'No posees un perfil asociado.'
          format.html { redirect_to new_proveedor_session }
          format.json { render json: @solicitante.errors, status: :unprocessable_entity }
        end 
      else
        flash[:info] = 'No has iniciado sesión.'
        format.html { redirect_to new_proveedor_session }
        format.json { render json: @proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /proveedor/categorias
  def update_categorias_de_proveedor
    if proveedor_signed_in?
      @proveedor = Proveedor.find(current_proveedor.perfilable_id)
      if params[:proveedor].nil?
        params[:proveedor] ||= {}
      end
    end
    respond_to do |format|
      if proveedor_signed_in?
        if params[:proveedor][:categoria_ids].nil?
          @proveedor.categorias.clear
          flash[:success] = "Categorías actualizadas."
          format.html { redirect_to categorias_de_proveedor_path }
          format.json { render :json => {tipo_mensaje: :success, mensaje: flash[:success]} }
        elsif @proveedor.update_attributes(params[:proveedor])
          flash[:success] = "Categorías actualizadas."
          format.html { redirect_to categorias_de_proveedor_path }
          format.json { render :json => {tipo_mensaje: :success, mensaje: flash[:success]} }
        else
          flash[:error] = "Ocurrió un error. Revisa el formulario."
          format.html { render action: "categorias_de_proveedor" }
          format.json { render :json => {tipo_mensaje: :danger, mensaje: flash[:error], errores: @proveedor.errors, status: :unprocessable_entity} }
        end
      else
        flash[:info] = 'No ha iniciado sesión.'
        format.html { redirect_to new_proveedor_session }
        format.json { render :json => {tipo_mensaje: :info, mensaje: flash[:info]} }
      end
    end
  end
end
