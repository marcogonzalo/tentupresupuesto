# coding: utf-8
class EvaluacionesController < ApplicationController
  before_filter :authenticated_solicitante, :only => [:new,:create]
  before_filter :authenticated_proveedor, :only => [:edit,:update]
  # GET /evaluaciones
  # GET /evaluaciones.json
  def index
    @evaluaciones = Evaluacion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @evaluaciones }
    end
  end

  # GET /evaluaciones/1
  # GET /evaluaciones/1.json
  def show
    @evaluacion = Evaluacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @evaluacion }
    end
  end

  # GET /evaluaciones/new
  # GET /evaluaciones/new.json
  def new
    @trabajo = Trabajo.find(params[:trabajo_id])
    @evaluacion = @trabajo.build_evaluacion

    @path = [@trabajo, @evaluacion]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @evaluacion }
    end
  end

  # GET /evaluaciones/1/edit
  def edit
    @evaluacion = Evaluacion.find(params[:id])
  end
  
################  
######## ACCIONES
################

  # POST /evaluaciones
  # POST /evaluaciones.json
  def create
    @trabajo = Trabajo.find(params[:trabajo_id])
    @evaluacion = @trabajo.build_evaluacion(params[:evaluacion])
    @evaluacion.proveedor_id = @trabajo.contratado_id

    @path = [@trabajo, @evaluacion]
    respond_to do |format|
      if @evaluacion.save
        unless params[:evaluacion][:imagen].nil? or params[:evaluacion][:imagen].blank?
          @imagen = @evaluacion.imagen.create(:archivo => params[:evaluacion][:imagen], :descripcion => params[:evaluacion][:imagen][:descripcion], :proposito => "evaluacion")
        end
        # TtpMailer.notificar_trabajo_evaluado(@trabajo)
        flash[:success] = "¡Trabajo evaluado!. Acabas de contribuir con otros solicitantes."
        format.html { redirect_to panel_solicitante_path }
        format.json { render json: @evaluacion, status: :created, location: @evaluacion }
      else
        flash[:error] = "Ocurrió un error. Revisa el formulario."
        format.html { render action: "new" }
        format.json { render json: @evaluacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /evaluaciones/1
  # PUT /evaluaciones/1.json
  def update
    @evaluacion = Evaluacion.find(params[:id])

    respond_to do |format|
      if @evaluacion.update_attributes(params[:evaluacion])
        format.html { redirect_to @evaluacion, notice: 'Evaluacion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @evaluacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluaciones/1
  # DELETE /evaluaciones/1.json
  def destroy
    @evaluacion = Evaluacion.find(params[:id])
    @evaluacion.destroy

    respond_to do |format|
      format.html { redirect_to evaluaciones_url }
      format.json { head :no_content }
    end
  end
end
