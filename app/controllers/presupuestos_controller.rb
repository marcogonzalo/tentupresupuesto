# coding: utf-8
class PresupuestosController < ApplicationController
  before_filter :authenticate_solicitante!, :only => [:index, :aceptar_presupuesto, :rechazar_presupuesto]
  before_filter :authenticate_proveedor!, :except => [:index, :show, :aceptar_presupuesto, :rechazar_presupuesto]
  before_filter :authenticate_any, :only => [:show]
  # GET /presupuestos
  # GET /presupuestos.json
  def index
    @trabajo = Trabajo.find(params[:trabajo_id])
    @presupuestos = @trabajo.presupuestos.where(:rechazado => false)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @presupuestos }
    end
  end

  # GET /presupuestos/1
  # GET /presupuestos/1.json
  def show
    @presupuesto = Presupuesto.find(params[:id])
    @trabajo = Trabajo.find(@presupuesto.trabajo_id)
    
    #Verificar si el trabajo existe y el usuario es el solicitante
    @es_el_solicitante = false
    if solicitante_signed_in?
      @es_el_solicitante = @trabajo.solicitante_id.eql?(current_solicitante.perfilable_id)
      @tipo_usuario = current_solicitante.perfilable_type
      m_u = 'proveedor'
    end
    @es_el_proveedor = false
    if proveedor_signed_in?
      @es_el_solicitante = @presupuesto.proveedor_id.eql?(current_proveedor.perfilable_id)
      @tipo_usuario = current_proveedor.perfilable_type
      m_u = 'solicitante'
    end
    
    if @es_el_solicitante or @es_el_proveedor
      @mensajes = @presupuesto.mensajes.order("created_at")
      @mensajes.update_all({ :visto => true }, ['usuario = ?', m_u])
      @mensaje = @presupuesto.mensajes.build(:usuario => @tipo_usuario)
    end
    respond_to do |format|
      if @es_el_solicitante or @es_el_proveedor
        format.html # show.html.erb
      else
        flash[:warning] = "No tienes permiso para ver la información del presupuesto."
        format.html { redirect_to @trabajo }
      end
      format.json { render json: @presupuesto }
    end
  end

  # GET /presupuestos/new
  # GET /presupuestos/new.json
  def new
    @trabajo = Trabajo.find(params[:trabajo_id])
    @presupuesto = @trabajo.presupuestos.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @presupuesto }
    end
  end

  # GET /presupuestos/1/edit
  def edit
    @presupuesto = Presupuesto.find(params[:id])
  end

  # POST /presupuestos
  # POST /presupuestos.json
  def create
    @trabajo = Trabajo.find(params[:trabajo_id])
    @presupuesto = @trabajo.presupuestos.build(params[:presupuesto])
    @presupuesto.proveedor_id = current_proveedor.perfilable_id

    respond_to do |format|
      if @presupuesto.save
        flash[:success] = "Presupuesto enviado satisfactoriamente."
        format.html { redirect_to @trabajo }
        format.json { render json: @presupuesto, status: :created, location: @presupuesto }
      else
        flash[:error] = "Ocurrió un error. Revisa el formulario."
        format.html { render action: "new" }
        format.json { render json: @presupuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /presupuestos/1
  # PUT /presupuestos/1.json
  def update
    @presupuesto = Presupuesto.find(params[:id])

    respond_to do |format|
      if @presupuesto.update_attributes(params[:presupuesto])
        flash[:success] = "Presupuesto actualizado satisfactoriamente."
        format.html { redirect_to @presupuesto }
        format.json { head :no_content }
      else
        flash[:error] = "Ocurrió un error. Revisa el formulario."
        format.html { render action: "edit" }
        format.json { render json: @presupuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presupuestos/1
  # DELETE /presupuestos/1.json
  def destroy
    @presupuesto = Presupuesto.find(params[:id])
    @presupuesto.destroy

    respond_to do |format|
      flash[:success] = "Presupuesto eliminado."
      format.html { redirect_to presupuestos_url }
      format.json { head :no_content }
    end
  end
  
  def aceptar_presupuesto
    @presupuesto = Presupuesto.find(params[:id])
    es_el_solicitante = Trabajo.exists?(:id => @presupuesto.trabajo_id, :solicitante_id => current_solicitante.perfilable_id)
    
    respond_to do |format|
      if es_el_solicitante
        if @presupuesto.update_attribute('aprobado',true)
          flash[:success] = "El presupuesto ha sido aceptado."
          format.json { render :json => { presupuesto: @presupuesto, tipo_mensaje: :success, mensaje: flash[:success]}}
        else
          flash[:error] = "Ocurrió un error. No pudo aceptarse el presupuesto."
          format.json { render :json => { presupuesto: @presupuesto.errors, tipo_mensaje: :error, mensaje: flash[:error]} }
        end    
      else
        flash[:warning] = "Sólo el solicitante puede aprobar o rechazar el presupuesto."
        format.json { render :json => {tipo_mensaje: :warning, mensaje: flash[:warning]} }
      end
    end
  end
  
  def rechazar_presupuesto
    @presupuesto = Presupuesto.find(params[:id])
    es_el_solicitante = Trabajo.exists?(:id => @presupuesto.trabajo_id, :solicitante_id => current_solicitante.perfilable_id)
    if es_el_solicitante
      @presupuesto.aprobado = false
      @presupuesto.rechazado = true
      @presupuesto.motivo_rechazo = params[:presupuesto][:motivo_rechazo].to_sym
    end
    respond_to do |format|
      if es_el_solicitante
        if @presupuesto.save
          flash[:success] = "El presupuesto ha sido rechazado."
          format.json { render :json => { presupuesto: @presupuesto, tipo_mensaje: :success, mensaje: flash[:success]}}
        else
          flash[:error] = "Ocurrió un error. No pudo rechazarse el presupuesto."
          format.json { render :json => { presupuesto: @presupuesto.errors, tipo_mensaje: :error, mensaje: flash[:error]} }
        end    
      else
        flash[:warning] = "Sólo el solicitante puede aprobar o rechazar el presupuesto."
        format.json { render :json => {tipo_mensaje: :warning, mensaje: flash[:warning]} }
      end
    end
  end
end
