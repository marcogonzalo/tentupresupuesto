# coding: utf-8
class SolicitantesController < ApplicationController
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
    @solicitante = Solicitante.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @solicitante }
    end
  end

  # GET /solicitantes/new
  # GET /solicitantes/new.json
  def new
    @solicitante = Solicitante.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @solicitante }
    end
  end

  # GET /solicitantes/1/edit
  def edit
    @solicitante = Solicitante.find(params[:id])
  end

  # POST /solicitantes
  # POST /solicitantes.json
  def create
    @solicitante = Solicitante.new(params[:solicitante])

    respond_to do |format|
      if solicitante_signed_in?
        if current_solicitante.perfilable_id.nil? or current_solicitante.perfilable_id <= 0
          if @solicitante.save
            current_solicitante.update_attribute('perfilable_id', @solicitante.id)
            
            flash[:success] = "Datos de proveedor registrados."
            format.html { redirect_to @solicitante }
            format.json { render json: @solicitante, status: :created, location: @solicitante }
          else
            flash[:error] = "Error al procesar la información."
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
        format.html { redirect_to new_solicitante_session }
        format.json { render json: solicitante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /solicitantes/1
  # PUT /solicitantes/1.json
  def update
    @solicitante = Solicitante.find(params[:id])

    respond_to do |format|
      if @solicitante.update_attributes(params[:solicitante])
        format.html { redirect_to @solicitante, notice: 'Datos actualizados.' }
        format.json { head :no_content }
      else
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
      format.html { redirect_to solicitantes_url }
      format.json { head :no_content }
    end
  end
  
  def perfil
    @solicitante = current_solicitante.datos_y_perfil

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @solicitante }
    end
  end
end
