# coding: utf-8
class RegistrationsController < Devise::RegistrationsController
  before_filter :no_authenticated, :only => [:new, :create]
  def edit
    if solicitante_signed_in? or proveedor_signed_in?
      if solicitante_signed_in?
        parametros = params[:solicitante]
        current_usuario = current_solicitante
      elsif proveedor_signed_in?
        parametros = params[:proveedor]
        current_usuario = current_proveedor
      end
      @usuario = Usuario.find(current_usuario.id)
    end
  end
  
  def update
    # required for settings form to submit when password is left blank
    if solicitante_signed_in? or proveedor_signed_in?
      if solicitante_signed_in?
        parametros = params[:solicitante]
        current_usuario = current_solicitante
      elsif proveedor_signed_in?
        parametros = params[:proveedor]
        current_usuario = current_proveedor
      end
      @usuario = Usuario.find(current_usuario.id)
      email_changed = @usuario.email != parametros[:email]
      password_changed = true
      if parametros[:password].blank?
        password_changed = false
        parametros.delete("password")
        parametros.delete(:current_password)
        parametros.delete("password_confirmation")
      end
      # parametros[:email_confirmation] = parametros[:email] unless email_changed # Para que no de error de confirmación de correo

      successfully_updated = false
      if password_changed
        actualizado = @usuario.update_with_password(parametros)
        successfully_updated = true
      else
        actualizado = @usuario.update_without_password(parametros)
        successfully_updated = true
      end

      if successfully_updated and actualizado
        set_flash_message :notice, :updated
        # Sign in the user bypassing validation in case his password changed
        sign_in @usuario, :bypass => true
        redirect_to after_update_path_for(@usuario)
      else
        render "edit"
      end
    end
  end

  protected
  def after_sign_up_path_for(resource)
    case resource.perfilable_type
    when "Solicitante"
      return new_solicitante_path
    when "Proveedor"
      return new_proveedor_path
    else
      root_path
    end
  end

  def after_inactive_sign_up_path_for(resource)
    new_confirmation_path(resource.perfilable_type)
  end
  
  
  
  def after_update_path_for(resource)
    case resource.perfilable_type
      when "solicitante"
        return panel_solicitante_path
      when "proveedor"
        return panel_proveedor_path
      else
        return root_path
      end
    return root_path
  end
end