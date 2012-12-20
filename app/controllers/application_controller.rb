class ApplicationController < ActionController::Base
  protect_from_forgery
  FLASH_NOTICE_KEYS = [:error, :warning, :info, :success] # Tipos de notificaciones bootstrap

  def flash_messages
    return unless messages = flash.keys.select{|k| FLASH_NOTICE_KEYS.include?(k)}
    formatted_messages = messages.map do |type|      
      content_tag :div, :class => type.to_s do
        message_for_item(flash[type], flash["#{type}_item".to_sym])
      end
    end
    formatted_messages.join
  end

  def message_for_item(message, item = nil)
    if item.nil?
      message
    else
      if item.is_a?(Array)
        message % link_to(*item)
      else
        message % item
      end
    end
  end
  
  protected
  def authenticate_any
    unless solicitante_signed_in? or proveedor_signed_in?
      redirect_to new_solicitante_session_path
    end
    return true
  end
  
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
          when "solicitante"
            return solicitantes_path
          when "proveedor"
            return proveedores_path
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
