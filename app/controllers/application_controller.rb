# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  FLASH_NOTICE_KEYS = [:error, :warning, :info, :success] # Tipos de notificaciones bootstrap
  
  add_breadcrumb "TTP", '/'
  
  def current_user
    return current_solicitante ? current_solicitante : current_proveedor
  end

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
  def authenticated_any
    unless signed_in?
      if solicitante_signed_in?
        redirect_to new_solicitante_session_path
      else
        redirect_to new_proveedor_session_path
      end
    end
    return true
  end
  
  def authenticated_solicitante
    if solicitante_signed_in? or admin_signed_in?
      if current_solicitante.perfilable_id.nil? and (request.fullpath != new_solicitante_path and request.fullpath != solicitantes_path and request.fullpath != no_soy_solicitante_path)
        redirect_to new_solicitante_path
      end
    else
      sign_out_all_scopes
      flash[:warning] = "Debes iniciar sesión con el usuario correcto" 
      redirect_to new_solicitante_session_path
    end
    return true
  end
  
  def authenticated_proveedor
    if proveedor_signed_in? or admin_signed_in?
      if current_proveedor.perfilable_id.nil? and (request.fullpath != new_proveedor_path and request.fullpath != proveedores_path and request.fullpath != no_soy_proveedor_path)
        redirect_to new_proveedor_path
      end
    else
      sign_out_all_scopes
      flash[:warning] = "Debes iniciar sesión con el usuario correcto" 
      redirect_to new_proveedor_session_path
    end
    return true
  end
  
  def authenticated_admin
    unless admin_signed_in?
      sign_out_all_scopes
      flash[:warning] = "Debes iniciar sesión con el usuario correcto" 
      redirect_to root_path
    end
    return true
  end
  
  def no_authenticated
    if solicitante_signed_in?
      return true if current_solicitante.perfilable_id.nil? or current_solicitante.perfilable_id < 1
      redirect_to panel_solicitante_path
    elsif proveedor_signed_in?
      return true if current_proveedor.perfilable_id.nil? or current_proveedor.perfilable_id < 1
      redirect_to panel_proveedor_path
    end
    return true
  end
  
  private
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
end
