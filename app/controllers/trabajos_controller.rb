# coding: utf-8
class TrabajosController < ApplicationController
  before_filter :authenticated_solicitante, :except => [:show, :index]
  layout :resolve_layout
  add_breadcrumb :index, :trabajos_path
  # GET /trabajos
  # GET /trabajos.json
  def index
    unless params[:filtro].nil?
      @trabajos = []
      if FiltroListaTrabajos::FILTROS.include?(params[:filtro]) and not params[:valor].nil?
        case params[:filtro]
        when "categoria"
          @categoria = Categoria.find(params[:valor])
          @trabajos =  @categoria.nil? ? [] : @categoria.trabajos.page(params[:p])
        when "estatus"
          existe_estatus = Trabajo::ESTATUS.include?(params[:valor])
          @estatus = Trabajo::ESTATUS.include?(params[:valor]) ? params[:valor].to_s.humanize : nil
          @trabajos = existe_estatus ? Trabajo.where(:estatus => params[:valor]).page(params[:p]) : []
        when "ubicacion"
          @ubicacion = UbicacionGeografica.find(params[:valor])
          unless @ubicacion.nil?
            case @ubicacion.tipo
            when 'pais'
              @trabajos = @ubicacion.trabajos_de_pais.page(params[:p])
            when 'estado'
              @trabajos = @ubicacion.trabajos_de_estado.page(params[:p])
            when 'municipio'
              @trabajos = @ubicacion.trabajos_de_municipio.page(params[:p])
            when 'localidad'
              @trabajos = @ubicacion.trabajos_de_localidad.page(params[:p])
            end
          end
        end
      end
    else
      @trabajos = Trabajo.order('created_at').page(params[:p])
    end
    @cant_resultados = @trabajos.size
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trabajos }
    end
  end

  # GET /trabajos/1
  # GET /trabajos/1.json
  def show
    @trabajo = Trabajo.includes(:presupuestos,:contratado).find(params[:id])
    if request.path != trabajo_path(@trabajo)
      redirect_to @trabajo, status: :moved_permanently
    end
    @es_el_solicitante = solicitante_signed_in? and current_solicitante.perfilable_id.eql?(@trabajo.solicitante_id)
    
    if @trabajo.ejecutando? and proveedor_signed_in?
      @es_el_proveedor = current_proveedor.perfilable_id.eql?(@trabajo.contratado_id)
    end
    add_breadcrumb @trabajo.proposito
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trabajo }
    end
  end

  # GET /trabajos/new
  # GET /trabajos/new.json
  def new
    perfil = current_solicitante.perfil
    
    @trabajo = Trabajo.new
    
    @trabajo.pais_id = perfil.pais_id unless perfil.pais_id.nil?
    @trabajo.estado_id = perfil.estado_id unless perfil.estado_id.nil?
    @trabajo.municipio_id = perfil.municipio_id unless perfil.municipio_id.nil?
    @trabajo.localidad_id = perfil.localidad_id unless perfil.localidad_id.nil?
    @localidad = @trabajo.localidad ? @trabajo.localidad.nombre : ""
    unless perfil.direccion.empty?
      direccion = perfil.direccion
      pto_ref = perfil.punto_referencia.empty? ? "" : ". Punto de referencia: "+perfil.punto_referencia
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

  # POST /trabajos
  # POST /trabajos.json
  def create
    params[:trabajo][:pais_id] = 1 # Venezuela
    @localidad = ""
    unless params[:trabajo][:localidad_id].empty?
      @localidad = params[:trabajo][:localidad_id]
      params[:trabajo][:localidad_id] = UbicacionGeografica.buscar_o_crear_id_de_entidad(params[:trabajo][:localidad_id],'localidad',params[:trabajo][:municipio_id])
    end
    
    @trabajo = Trabajo.new(params[:trabajo])

    respond_to do |format|
      @trabajo.solicitante_id = current_solicitante.perfilable_id
      if @trabajo.save
        TtpMailer.notificar_solicitud_publicada(@trabajo)
        flash[:success] = "Solicitud publicada exitosamente"
        format.html { redirect_to @trabajo }
        format.json { render json: @trabajo, status: :created, location: @trabajo }
      else
        flash[:error] = "Ocurrió un error. Revisa el formulario."
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
    @localidad = ""
    unless params[:trabajo][:localidad_id].empty?
      params[:trabajo][:localidad_id] = UbicacionGeografica.buscar_o_crear_id_de_entidad(params[:trabajo][:localidad_id],'localidad',params[:trabajo][:municipio_id])
    end

    respond_to do |format|
      if @trabajo.update_attributes(params[:trabajo])
        flash[:success] = "Solicitud actualizada."
        format.html { redirect_to @trabajo }
        format.json { head :no_content }
      else
        flash[:warning] = "Ocurrió un error. Revisa el formulario."
        format.html { render action: "edit" }
        format.json { render json: @trabajo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trabajos/1
  # DELETE /trabajos/1.json
  def destroy
    @trabajo = Trabajo.find(params[:id])
    @trabajo.destroy

    respond_to do |format|
      flash[:success] = "Solicitud eliminada."
      format.html { redirect_to trabajos_url }
      format.json { head :no_content }
    end
  end
  
  def finalizar_trabajo
    @trabajo = Trabajo.find(params[:id])
    es_el_solicitante = @trabajo.solicitante_id == current_solicitante.perfilable_id
    
    respond_to do |format|
      if es_el_solicitante
        if @trabajo.update_attribute('estatus','finalizado')
          TtpMailer.notificar_trabajo_finalizado(@trabajo)
          flash[:success] = "Has marcado como finalizado el trabajo. Recuerda evaluar al proveedor en cuanto sea posible."
          format.json { render :json => { presupuesto: @trabajo, tipo_mensaje: :success, mensaje: flash[:success]}}
        else
          flash[:error] = "Ocurrió un error. No pudo finalizarse el trabajo."
          format.json { render :json => { presupuesto: @trabajo.errors, tipo_mensaje: :error, mensaje: flash[:error]} }
        end    
      else
        flash[:warning] = "Sólo el solicitante puede finalizar."
        format.json { render :json => {tipo_mensaje: :warning, mensaje: flash[:warning]} }
      end
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
