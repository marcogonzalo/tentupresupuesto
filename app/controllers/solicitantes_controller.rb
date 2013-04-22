# coding: utf-8
class SolicitantesController < ApplicationController
  before_filter :no_authenticated, :only => [:new, :create]
  before_filter :authenticated_solicitante, :except => [:new, :create]
  # GET /solicitantes
  # GET /solicitantes.json
  def index
    @solicitantes = Solicitante.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @solicitantes }
    end
  end

  # GET /solicitantes/1
  # GET /solicitantes/1.json
  def show
    @solicitante = current_solicitante.datos_y_perfil
    
    add_breadcrumb :panel, panel_solicitante_path
    add_breadcrumb :show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @solicitante }
    end
  end

  # GET /solicitantes/new
  # GET /solicitantes/new.json
  def new
    @solicitante = Solicitante.new
    @localidad = ""
    
    add_breadcrumb :panel, panel_solicitante_path
    add_breadcrumb :new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @solicitante }
    end
  end

  # GET /solicitantes/1/edit
  def edit
    @solicitante = Solicitante.find(current_solicitante.perfilable_id)
    @localidad = @solicitante.localidad ? @solicitante.localidad.nombre : ""
    
    add_breadcrumb :panel, panel_solicitante_path
    add_breadcrumb :edit
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @solicitante }
    end
  end
  
  def panel
    @solicitudes = Trabajo.includes(:presupuestos).where(:solicitante_id => current_solicitante.perfilable_id).estatus_buscando
    @en_ejecucion = Trabajo.includes(:presupuestos).where(:solicitante_id => current_solicitante.perfilable_id).estatus_ejecutando
    @por_evaluar = Trabajo.sin_evaluar.where(:solicitante_id => current_solicitante.perfilable_id).estatus_finalizado

    render "panel"
  end

################  
######## ACCIONES
################

  # POST /solicitantes
  # POST /solicitantes.json
  def create
    params[:solicitante][:pais_id] = 1 # Venezuela
    @localidad = ""
    unless params[:solicitante][:localidad_id].empty?
      @localidad = params[:solicitante][:localidad_id]
      params[:solicitante][:localidad_id] = UbicacionGeografica.buscar_o_crear_id_de_entidad(params[:solicitante][:localidad_id],'localidad',params[:solicitante][:municipio_id])
    end
    
    @solicitante = Solicitante.new(params[:solicitante])
    
    respond_to do |format|
      if current_solicitante.perfilable_id.nil? or current_solicitante.perfilable_id <= 0
        if @solicitante.save
          current_solicitante.update_attribute('perfilable_id', @solicitante.id)
          
          flash[:success] = "Datos de solicitante registrados."
          format.html { redirect_to panel_solicitante_path }
          format.json { render json: @solicitante, status: :created, location: @solicitante }
        else
          flash[:error] = "Ocurrió un error. Revisa el formulario."
          format.html { render action: "new" }
          format.json { render json: @solicitante.errors, status: :unprocessable_entity }
        end
      else
        flash[:warning] = 'Ya posee un perfil asociado.'
        format.html { render action: "new" }
        format.json { render json: @solicitante.errors, status: :unprocessable_entity }
      end 
    end
  end

  # PUT /solicitantes/1
  # PUT /solicitantes/1.json
  def update
    @solicitante = Solicitante.find(current_solicitante.perfilable_id)

    params[:solicitante][:pais_id] = 1 # Venezuela
    @localidad = ""
    unless params[:solicitante][:localidad_id].empty?
      @localidad = params[:solicitante][:localidad_id]
      params[:solicitante][:localidad_id] = UbicacionGeografica.buscar_o_crear_id_de_entidad(params[:solicitante][:localidad_id],'localidad',params[:solicitante][:municipio_id])
    end
    
    respond_to do |format|
      if @solicitante.update_attributes(params[:solicitante])
        flash[:success] = "Perfil actualizado."
        format.html { redirect_to panel_solicitante_path }
        format.json { head :no_content }
      else
        flash[:error] = "Ocurrió un error. Revisa el formulario."
        format.html { render action: "edit" }
        format.json { render json: @solicitante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicitantes/1
  # DELETE /solicitantes/1.json
  def destroy
    @solicitante = Solicitante.find(params[:id])
    @solicitante.destroy

    respond_to do |format|
      flash[:success] = "Solicitante eliminado."
      format.html { redirect_to solicitantes_url }
      format.json { head :no_content }
    end
  end


end
