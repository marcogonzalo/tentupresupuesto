class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  def after_sign_in_path_for(resource)
    unless resource.confirmed_at.nil?
      if resource.perfilable_id.nil? or resource.perfilable_id <= 0
        case resource.perfilable_type
          when "solicitante"
            return new_solicitante_path
          when "proveedor"
            return new_proveedor_path
          else
            root_path
          end
      else
        case resource.perfilable_type
          when "Solicitante"
            return solicitantes_index_path
          when "Proveedor"
            return proveedores_index_path
          else
            root_path
          end
      end
    else
      return new_confirmation_path(resource.perfilable_type)
    end
    return root_path
  end
end
