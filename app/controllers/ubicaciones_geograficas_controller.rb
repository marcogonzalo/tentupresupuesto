class UbicacionesGeograficasController < ApplicationController
  # GET /ubicaciones_geograficas
  # GET /ubicaciones_geograficas.json
  def index
    @ubicaciones_geograficas = UbicacionGeografica.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ubicaciones_geograficas }
    end
  end

  # GET /ubicaciones_geograficas/1
  # GET /ubicaciones_geograficas/1.json
  def show
    @ubicacion_geografica = UbicacionGeografica.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ubicacion_geografica }
    end
  end

  # GET /ubicaciones_geograficas/new
  # GET /ubicaciones_geograficas/new.json
  def new
    @ubicacion_geografica = UbicacionGeografica.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ubicacion_geografica }
    end
  end

  # GET /ubicaciones_geograficas/1/edit
  def edit
    @ubicacion_geografica = UbicacionGeografica.find(params[:id])
  end

  # POST /ubicaciones_geograficas
  # POST /ubicaciones_geograficas.json
  def create
    @ubicacion_geografica = UbicacionGeografica.new(params[:ubicacion_geografica])

    respond_to do |format|
      if @ubicacion_geografica.save
        format.html { redirect_to @ubicacion_geografica, notice: 'Ubicacion geografica was successfully created.' }
        format.json { render json: @ubicacion_geografica, status: :created, location: @ubicacion_geografica }
      else
        format.html { render action: "new" }
        format.json { render json: @ubicacion_geografica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ubicaciones_geograficas/1
  # PUT /ubicaciones_geograficas/1.json
  def update
    @ubicacion_geografica = UbicacionGeografica.find(params[:id])

    respond_to do |format|
      if @ubicacion_geografica.update_attributes(params[:ubicacion_geografica])
        format.html { redirect_to @ubicacion_geografica, notice: 'Ubicacion geografica was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ubicacion_geografica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ubicaciones_geograficas/1
  # DELETE /ubicaciones_geograficas/1.json
  def destroy
    @ubicacion_geografica = UbicacionGeografica.find(params[:id])
    @ubicacion_geografica.destroy

    respond_to do |format|
      format.html { redirect_to ubicaciones_geograficas_url }
      format.json { head :no_content }
    end
  end
  
  def get_lista_entidades
    @ubicacion_geografica = UbicacionGeografica.where(:tipo=>params[:tipo_entidad], :entidad_id => params[:entidad_superior_id]).select("id, nombre")
    respond_to do |format|
      format.json { render :json => {lista_entidades: @ubicacion_geografica} }
    end
  end
end
