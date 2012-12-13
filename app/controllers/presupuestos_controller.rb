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

    respond_to do |format|
      format.html # show.html.erb
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
        flash[:alert] = "Hubo un error presentando presupuesto en la solicitud."
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
        format.html { redirect_to @presupuesto, notice: 'Presupuesto was successfully updated.' }
        format.json { head :no_content }
      else
        flash[:alert] = "Hubo un error actualizando el presupuesto."
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
      format.html { redirect_to presupuestos_url }
      format.json { head :no_content }
    end
  end
end
