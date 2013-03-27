# coding: utf-8
class MensajesController < ApplicationController
  before_filter :authenticated_any
  # GET /mensajes
  # GET /mensajes.json
  def index
    @mensajes = Mensaje.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mensajes }
    end
  end

  # GET /mensajes/1
  # GET /mensajes/1.json
  def show
    @mensaje = Mensaje.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mensaje }
    end
  end

  # GET /mensajes/new
  # GET /mensajes/new.json
  def new
    @mensaje = Mensaje.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mensaje }
    end
  end

  # POST /mensajes
  # POST /mensajes.json
  def create
    @presupuesto = Presupuesto.find(params[:presupuesto_id])
    @mensaje = @presupuesto.mensajes.build(params[:mensaje])
    
    respond_to do |format|
      if @mensaje.save
        flash[:success] = "Mensaje enviado satisfactoriamente."
        format.html { redirect_to presupuesto_path(@presupuesto,:anchor => "mensajes") }
        format.json { render json: @mensaje, status: :created, location: @mensaje }
      else
        flash[:error] = "Ocurrió un error. Revisa el formulario."
        format.html { redirect_to @presupuesto }
        format.json { render json: @mensaje.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mensajes/1
  # DELETE /mensajes/1.json
  def destroy
    @mensaje = Mensaje.find(params[:id])
    @presupuesto = Presupuesto.find(@mensaje.presupuesto_id)
    @mensaje.destroy

    respond_to do |format|
      flash[:success] = "Mensaje eliminado."
      format.html { redirect_to @presupuesto }
      format.json { head :no_content }
    end
  end
end
