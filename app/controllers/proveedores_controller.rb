# coding: utf-8
class ProveedoresController < ApplicationController
  before_filter :authenticate_proveedor!, :except => [:index, :show]
  # GET /proveedores
  # GET /proveedores.json
  def index
    @proveedores = Proveedor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @proveedores }
    end
  end

  # GET /proveedores/1
  # GET /proveedores/1.json
  def show
    @proveedor = Proveedor.find(params[:id])
    if request.path != proveedor_path(@proveedor)
      redirect_to @proveedor, status: :moved_permanently
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proveedor }
    end
  end

  # GET /proveedores/new
  # GET /proveedores/new.json
  def new
    @proveedor = Proveedor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proveedor }
    end
  end

  # GET /proveedores/1/edit
  def edit
    @proveedor = Proveedor.find(params[:id])
  end

  # POST /proveedores
  # POST /proveedores.json
  def create
    @proveedor = Proveedor.new(params[:proveedor])

    respond_to do |format|
      if proveedor_signed_in?
        if current_proveedor.perfilable_id.nil? or current_proveedor.perfilable_id <= 0
          if @proveedor.save
            current_proveedor.update_attribute('perfilable_id', @proveedor.id)
            
            flash[:success] = "Datos de proveedor registrados."
            format.html { redirect_to @proveedor }
            format.json { render json: @proveedor, status: :created, location: @proveedor }
          else
            flash[:error] = "Ocurrió un error. Revisa el formulario."
            format.html { render action: "new" }
            format.json { render json: @proveedor.errors, status: :unprocessable_entity }
          end
        else
          flash[:warning] = 'Ya posee un perfil asociado.'
          format.html { render action: "new"  }
          format.json { render json: @solicitante.errors, status: :unprocessable_entity }
        end 
      else
        flash[:info] = 'No ha iniciado sesión.'
        format.html { redirect_to new_proveedor_session }
        format.json { render json: @proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /proveedores/1
  # PUT /proveedores/1.json
  def update
    @proveedor = Proveedor.find(params[:id])
    
    respond_to do |format|
      if @proveedor.update_attributes(params[:proveedor])
        flash[:success] = "Perfil actualizado."
        format.html { redirect_to @proveedor }
        format.json { head :no_content }
      else
        flash[:error] = "Ocurrió un error. Revisa el formulario."
        format.html { render action: "edit" }
        format.json { render json: @proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proveedores/1
  # DELETE /proveedores/1.json
  def destroy
    @proveedor = Proveedor.find(params[:id])
    @proveedor.destroy

    respond_to do |format|
      flash[:success] = "Proveedor eliminado."
      format.html { redirect_to proveedores_url }
      format.json { head :no_content }
    end
  end

  def panel
    @presupuestos_presentados = Presupuesto.includes([:trabajo, :mensajes]).where("presupuestos.proveedor_id = ? AND trabajos.estatus = 'buscando'", current_proveedor.perfilable_id).order("trabajos.updated_at DESC")
    @trabajos_asignados = Presupuesto.includes([:trabajo, :mensajes]).where("trabajos.contratado_id = ? AND trabajos.estatus = 'ejecutando'", current_proveedor.perfilable_id).order("trabajos.updated_at DESC")
    render "panel"
  end
  
  def categorias_de_proveedor
    @proveedor = Proveedor.find(current_proveedor.perfilable_id)
    render "categorias"
  end
  
  def update_categorias_de_proveedor
    if proveedor_signed_in?
      @proveedor = Proveedor.find(current_proveedor.perfilable_id)
      if params[:proveedor].nil?
        params[:proveedor] ||= {}
      end
    end
    respond_to do |format|
       if proveedor_signed_in?
        if params[:proveedor][:categoria_ids].nil?
          @proveedor.categorias.clear
          flash[:success] = "Categorías actualizadas."
          format.html { redirect_to categorias_de_proveedor_path }
          format.json { render :json => {tipo_mensaje: :success, mensaje: flash[:success]} }
        elsif @proveedor.update_attributes(params[:proveedor])
          flash[:success] = "Categorías actualizadas."
          format.html { redirect_to categorias_de_proveedor_path }
          format.json { render :json => {tipo_mensaje: :success, mensaje: flash[:success]} }
        else
          flash[:error] = "Ocurrió un error. Revisa el formulario."
          format.html { render action: "categorias_de_proveedor" }
          format.json { render :json => {tipo_mensaje: :danger, mensaje: flash[:error], errores: @proveedor.errors, status: :unprocessable_entity} }
        end
      else
        flash[:info] = 'No ha iniciado sesión.'
        format.html { redirect_to new_proveedor_session }
        format.json { render :json => {tipo_mensaje: :info, mensaje: flash[:info]} }
      end
    end
  end
end
