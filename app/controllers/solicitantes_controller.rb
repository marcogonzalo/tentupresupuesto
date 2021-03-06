# coding: utf-8
class SolicitantesController < ApplicationController
  require 'genericas'
  #before_filter :no_authenticated, :only => [:new, :create]
  before_filter :authenticate_solicitante!
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
    @solicitante = current_usuario.datos_y_perfil
    
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
    @solicitante = Solicitante.find(current_usuario.perfilable_id)
    @localidad = @solicitante.localidad ? @solicitante.localidad.nombre : ""
    
    add_breadcrumb :panel, panel_solicitante_path
    add_breadcrumb :edit
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @solicitante }
    end
  end
  
  def panel
    @solicitudes = Trabajo.where(:solicitante_id => current_usuario.perfilable_id).includes(:presupuestos).estatus_buscando
    @en_ejecucion = Trabajo.where(:solicitante_id => current_usuario.perfilable_id).estatus_ejecutando
    @por_evaluar = Trabajo.sin_evaluar.where(:solicitante_id => current_usuario.perfilable_id).estatus_finalizado

    render "panel"
  end

################  
######## ACCIONES
################

  # POST /solicitantes
  # POST /solicitantes.json
  def create
    params[:solicitante][:pais_id] = 1 # Venezuela
    
    @localidad = params[:solicitante][:localidad_id]
    @solicitante = Solicitante.new(params[:solicitante])
    if Genericas::validar_parametros_a_objeto_sin_localidad(@solicitante, params[:solicitante])
      params[:solicitante][:localidad_id] = UbicacionGeografica.buscar_o_crear_id_de_localidad(@localidad,params[:solicitante][:municipio_id])
    end
    @solicitante = Solicitante.new(params[:solicitante])
    
    respond_to do |format|
      if usuario_signed_in?
        if current_usuario.perfilable_id.nil? or current_usuario.perfilable_id <= 0
          if @solicitante.save
            current_usuario.update_attribute('perfilable_id', @solicitante.id)
            
            if Rails.env.production?
              MailchimpController.subscribe(current_usuario.email,'solicitantes')
            end
            
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
      else
        flash[:info] = 'No ha iniciado sesión.'
        format.html { redirect_to new_proveedor_session }
        format.json { render json: @proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /solicitantes/1
  # PUT /solicitantes/1.json
  def update
    @solicitante = Solicitante.find(current_usuario.perfilable_id)

    params[:solicitante][:pais_id] = 1 # Venezuela
    
    @localidad = params[:solicitante][:localidad_id]
    if Genericas::validar_parametros_a_objeto_sin_localidad(@solicitante, params[:solicitante])
      params[:solicitante][:localidad_id] = UbicacionGeografica.buscar_o_crear_id_de_localidad(@localidad,params[:solicitante][:municipio_id])
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

  def no_soy_solicitante
    unless current_usuario.perfilable_id.blank?
      redirect_to panel_solicitante_path 
      return
    end
    
    current_usuario.update_attribute('perfilable_type','Proveedor')
    redirect_to new_proveedor_path
    return
  end

end
