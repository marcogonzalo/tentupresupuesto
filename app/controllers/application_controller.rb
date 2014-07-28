# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  FLASH_NOTICE_KEYS = [:error, :warning, :info, :success] # Tipos de notificaciones bootstrap
  
  add_breadcrumb "TTP", '/'

# Mensajes Flash 
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
# Fin Mensjes Flash  

  protected
  def authenticate_solicitante!
    if admin_signed_in? or (usuario_signed_in? and ["solicitante"].include? current_usuario.perfilable_type.downcase)
      if current_usuario.perfilable_id.nil? and (request.fullpath != new_solicitante_path and request.fullpath != solicitantes_path and request.fullpath != no_soy_solicitante_path)
        redirect_to new_solicitante_path
      else
        return true
      end
    end
    redirect_to new_usuario_session_path
  end
  
  def authenticate_proveedor!
    if admin_signed_in? or (usuario_signed_in? and ["proveedor"].include? current_usuario.perfilable_type.downcase)
      if current_usuario.perfilable_id.nil? and (request.fullpath != new_proveedor_path and request.fullpath != proveedores_path and request.fullpath != no_soy_proveedor_path)
        redirect_to new_proveedor_path
      else
        return true
      end
    end
    redirect_to new_usuario_session_path
  end
  
  def no_authenticated
    unless usuario_signed_in?
      return true if current_usuario.perfilable_id.nil? or current_usuario.perfilable_id < 1
      if ["solicitante", "proveedor"].include? current_usuario.perfilable_type.downcase
        redirect_to panel_path(current_usuario.perfilable_type.downcase)
      end
    end
    return true
  end
  
  private
  def after_sign_in_path_for(resource)
    resource_type = resource.perfilable_type.downcase
    if resource.instance_of?(Admin)
      return rails_admin.dashboard_path
    end
    
    if ["solicitante", "proveedor"].include? resource_type.downcase
      if resource.confirmed_at.nil?
        return new_confirmation_path(resource)
      else
        if resource.perfilable_id.nil? or resource.perfilable_id <= 0
          case resource_type
            when "solicitante"
              return new_solicitante_path
            when "proveedor"
              return new_proveedor_path
            else
              root_path
            end
        end
        # Construye path con los parametros enviados 
        # Ver: http://api.rubyonrails.org/classes/ActionDispatch/Routing/PolymorphicRoutes.html#method-i-polymorphic_path 
        return polymorphic_path([:panel,resource_type.to_sym])
      end
    end
    return root_path
  end

=begin  
  def after_sign_in_path_for(resource)
    if resource.instance_of?(Admin)
      return rails_admin.dashboard_path
    end
    
    resource_type = resource.perfilable_type.downcase
    unless resource.confirmed_at.nil?
      if resource.perfilable_id.nil? or resource.perfilable_id <= 0
        case resource_type
          when "solicitante"
            return new_solicitante_path
          when "proveedor"
            return new_proveedor_path
          else
            root_path
          end
      else
        case resource_type
          when "solicitante"
            return panel_solicitante_path
          when "proveedor"
            return panel_proveedor_path
          else
            root_path
          end
      end
    else
      return new_confirmation_path(resource_type)
    end
    return root_path
  end
=end
end
