# coding: utf-8
class TrabajosController < ApplicationController
  require 'genericas'
  before_filter :authenticate_solicitante!, :except => [:show, :index, :finalizar_trabajo]
  before_filter :authenticate_proveedor!, :only => [:finalizar_trabajo]
  before_filter :find_trabajo, :only => [:show]
  layout :resolve_layout
  add_breadcrumb :index, :trabajos_path

################  
######## VISTAS
################

  # GET /trabajos
  # GET /trabajos.json
  def index
    @titulo = "Todas las solicitudes"
    unless params[:filtro].nil?
      trabajos = []
      if FiltroListaTrabajos::FILTROS.include?(params[:filtro]) and not params[:valor].nil?
        case params[:filtro]
        when "categoria"
          if usuario_signed_in? and current_usuario.tipo?("proveedor") and params[:valor].eql?("mis-categorias")
            
            categorias = current_usuario.perfilable.categorias
            trabajos = Trabajo.where(:categoria_id => categorias)
            @cant_resultados = trabajos.size
            @titulo = "Mis categorías"
          else
            @categoria = Categoria.find(params[:valor])
            trabajos =  @categoria.nil? ? [] : @categoria.trabajos
            @cant_resultados = trabajos.size
            @titulo = @categoria.nombre
          end
        when "estatus"
          existe_estatus = Trabajo::ESTATUS.include?(params[:valor])
          @estatus = Trabajo::ESTATUS.include?(params[:valor]) ? params[:valor].to_s.humanize : nil
          trabajos = existe_estatus ? Trabajo.where(:estatus => params[:valor]) : []
          @cant_resultados = trabajos.size
          @titulo = @estatus
        when "ubicacion"
          @ubicacion = UbicacionGeografica.find(params[:valor])
          trabajos = [] if @ubicacion.nil?
          unless @ubicacion.nil?
            case @ubicacion.tipo
            when 'pais'
              trabajos = @ubicacion.trabajos_de_pais
            when 'estado'
              trabajos = @ubicacion.trabajos_de_estado
            when 'municipio'
              trabajos = @ubicacion.trabajos_de_municipio
            when 'localidad'
              trabajos = @ubicacion.trabajos_de_localidad
            end
          end
          @cant_resultados = trabajos.size
          @titulo = @ubicacion.tipo.humanize+" "+@ubicacion.nombre
        end
      end
    else
      trabajos = Trabajo.order('created_at DESC')
    end
    @cant_resultados = trabajos.size
    @trabajos = trabajos.includes(:categoria,:localidad,:municipio,:estado).order('created_at DESC').page(params[:p])
    @titulo += " ("+@cant_resultados.to_s+")"
    @categorias = Categoria.joins(:trabajos).order('nombre ASC').uniq
    # @categorias_meta = ""
    # for c in @categorias
    #   @categorias_meta += c.nombre+", "
    # end
    
    @ubicaciones = UbicacionGeografica.where(:tipo => 'estado', :entidad_id => 1)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trabajos }
    end
  end

  # GET /trabajos/1
  # GET /trabajos/1.json
  def show
    @trabajo = Trabajo.includes({:presupuestos => :proveedor},:contratado).find(params[:id])
    @es_el_solicitante = (usuario_signed_in? and current_usuario.tipo?("solicitante")) and current_usuario.perfilable_id.eql?(@trabajo.solicitante_id)
    
    if @trabajo.ejecutando? and (usuario_signed_in? and current_usuario.tipo?("proveedor")) 
      @es_el_proveedor = current_usuario.perfilable_id.eql?(@trabajo.contratado_id)
    end
    
    Trabajo.increment_counter(:visitas,@trabajo.id)
    add_breadcrumb @trabajo.proposito
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trabajo }
    end
  end

  # GET /trabajos/new
  # GET /trabajos/new.json
  def new
    perfil = current_usuario.perfil
    
    @trabajo = Trabajo.new
    
    @trabajo.pais_id = perfil.pais_id unless perfil.pais_id.nil?
    @trabajo.estado_id = perfil.estado_id unless perfil.estado_id.nil?
    @trabajo.municipio_id = perfil.municipio_id unless perfil.municipio_id.nil?
    @trabajo.localidad_id = perfil.localidad_id unless perfil.localidad_id.nil?
    @localidad = @trabajo.localidad ? @trabajo.localidad.nombre : ""
    unless perfil.direccion.blank?
      direccion = perfil.direccion
      pto_ref = perfil.punto_referencia.blank? ? "" : ". Punto de referencia: "+perfil.punto_referencia
      @trabajo.direccion = direccion+pto_ref
    end

    add_breadcrumb :new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trabajo }
    end
  end

  # GET /trabajos/1/edit
  def edit
    @trabajo = Trabajo.find(params[:id])
    @localidad = @trabajo.localidad ? @trabajo.localidad.nombre : ""

    add_breadcrumb :edit
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trabajo }
    end
  end

################  
######## ACCIONES
################

  # POST /trabajos
  # POST /trabajos.json
  def create
    params[:trabajo][:pais_id] = 1 # Venezuela
    @localidad = params[:trabajo][:localidad_id]
    @trabajo = Trabajo.new(params[:trabajo])
    if Genericas::validar_parametros_a_objeto_sin_localidad(@trabajo, params[:trabajo])
      params[:trabajo][:localidad_id] = UbicacionGeografica.buscar_o_crear_id_de_localidad(@localidad,params[:trabajo][:municipio_id])
    end

    @trabajo = Trabajo.new(params[:trabajo])
    respond_to do |format|
      @trabajo.solicitante_id = current_usuario.perfilable_id
      if @trabajo.save
        @cant_proveedores = Categoria.find(@trabajo.categoria_id).proveedores.where(:estado_id => @trabajo.estado_id).size
        if @cant_proveedores > 0
          TtpMailer.notificar_solicitud_publicada(@trabajo)
          flash[:success] = "Solicitud publicada los proveedores exitosamente. Hay <b>#{@cant_proveedores} en tu región</b>"
        else
          flash[:info] = "Solicitud publicada los proveedores exitosamente.<br>Por ahora <b>no tenemos proveedores registrados en tu región</b> para tu solicitud. <br>¡Trabajaremos para conseguirlos!"
        end
        format.html { redirect_to @trabajo }
        format.json { render json: @trabajo, status: :created, location: @trabajo }
      else
        flash[:error] = "Ocurrió un error. Revisa el formulario." #+@trabajo.errors.full_messages.to_s
        format.html { render action: "new" }
        format.json { render json: @trabajo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trabajos/1
  # PUT /trabajos/1.json
  def update
    @trabajo = Trabajo.find(params[:id])
    
    params[:trabajo][:pais_id] = 1 # Venezuela
    
    @localidad = params[:trabajo][:localidad_id]
    if Genericas::validar_parametros_a_objeto_sin_localidad(@trabajo, params[:trabajo])
      params[:trabajo][:localidad_id] = UbicacionGeografica.buscar_o_crear_id_de_localidad(@localidad,params[:trabajo][:municipio_id])
    end

    es_el_solicitante = (admin_signed_in? or (@trabajo.solicitante_id == current_usuario.perfilable_id))
    
    respond_to do |format|
      if es_el_solicitante
        if @trabajo.update_attributes(params[:trabajo])
          flash[:success] = "Solicitud actualizada."
          format.html { redirect_to @trabajo }
          format.json { head :no_content }
        else
          flash[:error] = "Ocurrió un error. Revisa el formulario."
          format.html { render action: "edit" }
          format.json { render json: @trabajo.errors, status: :unprocessable_entity }
        end
      else
        flash[:warning] = "Sólo el solicitante puede abrir la solicitud."
        format.html { redirect_to @trabajo }
        format.json { render :json => {tipo_mensaje: :warning, mensaje: flash[:warning]} }
      end
    end
  end

  # DELETE /trabajos/1
  # DELETE /trabajos/1.json
  def destroy
    @trabajo = Trabajo.find(params[:id])
    if admin_signed_in? or (@trabajo.solicitante_id == current_usuario.perfilable_id)
      @trabajo.destroy
    end
    respond_to do |format|
      flash[:success] = "Solicitud eliminada."
      format.html { redirect_to trabajos_url }
      format.json { head :no_content }
    end
  end
  
  def abrir_trabajo
    @trabajo = Trabajo.find(params[:id])
    es_el_solicitante = (@trabajo.solicitante_id == current_usuario.perfilable_id)
    
    respond_to do |format|
      if es_el_solicitante
        if @trabajo.update_attribute('estatus','buscando')
          flash[:success] = "Has reabierto la solicitud para recibir ofertas de proveedores."
          format.html { redirect_to @trabajo }
          format.json { render :json => { presupuesto: @trabajo, tipo_mensaje: :success, mensaje: flash[:success]}}
        else
          flash[:error] = "Ocurrió un error. No pudo abrir la solicitud."
          format.html { redirect_to @trabajo }
          format.json { render :json => { presupuesto: @trabajo.errors, tipo_mensaje: :error, mensaje: flash[:error]} }
        end    
      else
        flash[:warning] = "Sólo el solicitante puede abrir la solicitud."
        format.html { redirect_to @trabajo }
        format.json { render :json => {tipo_mensaje: :warning, mensaje: flash[:warning]} }
      end
    end
  end
  
  def cerrar_trabajo
    @trabajo = Trabajo.find(params[:id])
    es_el_solicitante = (@trabajo.solicitante_id == current_usuario.perfilable_id)
    
    respond_to do |format|
      if es_el_solicitante
        if @trabajo.update_attribute('estatus','cerrado')
          flash[:success] = "Has cerrado la solicitud y ya no recibirá más ofertas de proveedores."
          format.html { redirect_to @trabajo }
          format.json { render :json => { presupuesto: @trabajo, tipo_mensaje: :success, mensaje: flash[:success]}}
        else
          flash[:error] = "Ocurrió un error. No pudo cerrar la solicitud."
          format.html { redirect_to @trabajo }
          format.json { render :json => { presupuesto: @trabajo.errors, tipo_mensaje: :error, mensaje: flash[:error]} }
        end    
      else
        flash[:warning] = "Sólo el solicitante puede cerrar la solicitud."
        format.html { redirect_to @trabajo }
        format.json { render :json => {tipo_mensaje: :warning, mensaje: flash[:warning]} }
      end
    end
  end
  
  def finalizar_trabajo
    @trabajo = Trabajo.find(params[:id])
    es_el_proveedor = (@trabajo.contratado_id == current_usuario.perfilable_id)
    @trabajo.estatus = 'finalizado'
    @trabajo.precio_final = params[:trabajo][:precio_final]
    
    respond_to do |format|
      if es_el_proveedor
        if @trabajo.save
          TtpMailer.notificar_trabajo_finalizado(@trabajo)
          flash[:success] = "¡Finalizado el trabajo!. Hemos solicitado a tu cliente que te evalúe en cuanto le sea posible."
          format.json { render :json => { trabajo: @trabajo, tipo_mensaje: :success, mensaje: flash[:success]}}
          #redirect_to new_trabajo_evaluacion_path(@trabajo)
        else
          flash[:error] = "Ocurrió un error. No se pudo finalizar el trabajo."
          format.json { render :json => { trabajo: @trabajo.errors, tipo_mensaje: :error, mensaje: flash[:error]} }
        end    
      else
        flash[:warning] = "Sólo el proveedor contratado puede finalizar."
        format.json { render :json => {tipo_mensaje: :warning, mensaje: flash[:warning]} }
      end
    end
  end
  
  def find_trabajo
    @trabajo = Trabajo.find(params[:id])

    # If an old id or a numeric id was used to find the record, then
    # the request path will not match the post_path, and we should do
    # a 301 redirect that uses the current friendly id.
    if request.path != trabajo_path(@trabajo)
      return redirect_to @trabajo, :status => :moved_permanently
    end
  end
  
  private
  def resolve_layout
    case action_name
    when "show"
      "interna-liston"
    else
      "application"
    end
  end
end
