class TrabajosController < ApplicationController
  # GET /trabajos
  # GET /trabajos.json
  def index
    @trabajos = Trabajo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trabajos }
    end
  end

  # GET /trabajos/1
  # GET /trabajos/1.json
  def show
    @trabajo = Trabajo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trabajo }
    end
  end

  # GET /trabajos/new
  # GET /trabajos/new.json
  def new
    perfil = current_solicitante.perfil
    
    if perfil.direccion.empty?
      @trabajo = Trabajo.new
    else
      direccion = perfil.direccion
      pto_ref = perfil.punto_referencia.nil? ? "" : ". Punto de referencia: "+perfil.punto_referencia
      @trabajo = Trabajo.new(:direccion => direccion+pto_ref)
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trabajo }
    end
  end

  # GET /trabajos/1/edit
  def edit
    @trabajo = Trabajo.find(params[:id])
  end

  # POST /trabajos
  # POST /trabajos.json
  def create
    
    @trabajo = Trabajo.new(params[:trabajo])

    respond_to do |format|
      @trabajo.solicitante_id = current_solicitante.perfilable_id
      if @trabajo.save
        format.html { redirect_to @trabajo, notice: 'Trabajo was successfully created.' }
        format.json { render json: @trabajo, status: :created, location: @trabajo }
      else
        format.html { render action: "new" }
        format.json { render json: @trabajo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trabajos/1
  # PUT /trabajos/1.json
  def update
    @trabajo = Trabajo.find(params[:id])

    respond_to do |format|
      if @trabajo.update_attributes(params[:trabajo])
        format.html { redirect_to @trabajo, notice: 'Trabajo was successfully updated.' }
        format.json { head :no_content }
      else
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
      format.html { redirect_to trabajos_url }
      format.json { head :no_content }
    end
  end
end
