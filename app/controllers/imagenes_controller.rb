# coding: utf-8
class ImagenesController < ApplicationController
  before_filter :authenticated_proveedor
  
  # GET /proveedor/galeria
  def galeria
    @proveedor = Proveedor.find(current_proveedor.perfilable_id)
    @imagenes = @proveedor.imagenes
    render "galeria_imagenes"
  end
  
################  
######## ACCIONES
################

  def editar_galeria
    @proveedor = Proveedor.find(current_proveedor.perfilable_id)
    @imagenes = @proveedor.imagenes
    
    respond_to do |format|
      if proveedor_signed_in?
        if @imagen = @proveedor.imagenes.create(:archivo => params[:proveedor][:imagenes][:imagen], :proposito => "galeria")
          flash[:success] = "Imagen de perfil modificada."
          format.html { render action: "galeria_imagenes" }
          format.json { render json: @imagen, status: :created, location: @imagen }
        else
          flash[:error] = "Ocurrió un error al modificar la imagen."
          format.html { render action: "galeria_imagenes" }
          format.json { render json: @imagen.errors, status: :unprocessable_entity }
        end 
      else
        flash[:info] = 'No has iniciado sesión.'
        format.html { redirect_to new_proveedor_session }
        format.json { render json: @proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proveedor/imagenes_galeria/1
  # DELETE /proveedor/imagenes_galeria/1.json
  def borrar_galeria
    imagen = Imagen.find(params[:id])
    proveedor = current_proveedor.perfil
    borrar = false
    if proveedor_signed_in?
      if imagen.imagenable_id == proveedor.id and imagen.imagenable_type == proveedor.class.to_s and imagen.proposito == "galeria"
        borrar = true
      end
    end
     

    respond_to do |format|
      if borrar
        if imagen
          flash[:success] = "Imagen eliminada." if imagen.remove_archivo!
          imagen.destroy
          format.html { redirect_to galeria_proveedor_path }
          format.json { head :no_content }
        else
          flash[:error] = "Ocurrió un error al eliminar la imagen."
          format.html { render action: "galeria_imagenes" }
          format.json { head :no_content }
        end
      else
        flash[:info] = 'No has iniciado sesión.'
        format.html { redirect_to new_proveedor_session }
        format.json { render json: proveedor.errors, status: :unprocessable_entity }
      end
    end
  end
end
