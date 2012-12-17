# coding: utf-8
class PresupuestosController < ApplicationController
  # GET /presupuestos
  # GET /presupuestos.json
  def index
    @presupuestos = Presupuesto.all

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
    @mensajes = @presupuesto.mensajes
    #Verificar si el trabajo existe y el usuario es el solicitante
    @es_el_solicitante = false
    if solicitante_signed_in?
      @es_el_solicitante = @trabajo.solicitante_id.eql?(current_solicitante.prefilable_id)
      @tipo_usuario = current_solicitante.perfilable_type
    end
    @es_el_proveedor = false
    if proveedor_signed_in?
      @es_el_solicitante = @presupuesto.proveedor_id.eql?(current_proveedor.perfilable_id)
      @tipo_usuario = current_proveedor.perfilable_type
    end
    @mensaje = @presupuesto.mensajes.build(:usuario => @tipo_usuario)
   
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
end
