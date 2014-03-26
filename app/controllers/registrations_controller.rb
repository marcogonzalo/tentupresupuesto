# coding: utf-8
class RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_usuario!, :except => [:new, :create]
  def edit
    if usuario_signed_in?
      parametros = params[:usuario]
      add_breadcrumb "Panel", polymorphic_path([:panel,current_usuario.perfilable_type.downcase.to_sym])
      @usuario = Usuario.find(current_usuario.id)
      add_breadcrumb "Editar datos de cuenta"
    end
  end
  
  def update
    # required for settings form to submit when password is left blank
    if usuario_signed_in?
      parametros = params[:usuario]
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
    case resource.perfilable_type.downcase
    when "solicitante"
      return new_solicitante_path
    when "proveedor"
      return new_proveedor_path
    else
      root_path
    end
  end

  def after_inactive_sign_up_path_for(resource)
    new_confirmation_path(resource.perfilable_type.downcase)
  end

  def after_update_path_for(resource)
    if ["solicitante", "proveedor"].include? resource.perfilable_type.downcase
      return polymorphic_path([:panel,resource.perfilable_type.downcase.to_sym])
    else
      root_path
    end
  end
end
