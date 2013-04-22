module ApplicationHelper
  #Reescritura de helpers _signed_in?
  def solicitante_signed_in?
    if !!current_solicitante and current_solicitante.perfilable_type.downcase == "solicitante"
      if !current_solicitante.perfilable_id.nil? and current_solicitante.perfilable_id > 0
        !!current_solicitante
      else
        new_solicitante_url
      end
    else
      nil
    end
  end
  
  def proveedor_signed_in?
    if !!current_proveedor and current_proveedor.perfilable_type.downcase == "proveedor"
      if !current_proveedor.perfilable_id.nil? and current_proveedor.perfilable_id > 0
        !!current_proveedor
      else
        new_proveedor_path
      end
    else
      nil
    end
  end
end
