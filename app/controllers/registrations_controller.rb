class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    case resource.perfilable_type
    when "solicitante"
      return new_solicitante_path
    when "proveedor"
      return new_proveedor_path
    else
      root_path
    end
  end

  def after_inactive_sign_up_path_for(resource)
    new_confirmation_path(resource.perfilable_type)
  end
end