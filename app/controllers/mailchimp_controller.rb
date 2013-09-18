# coding: utf-8
require 'mailchimp'

class MailchimpController < ApplicationController
  def self.subscribe(email,lista)
    @mc = Mailchimp::API.new(MAILCHIMP_API_KEY)
    case lista
    when 'solicitantes'
      list_id = 'd503ae082d'
    when 'proveedores'
      list_id = '6769b54e06'
    end
    begin
      @mc.lists.subscribe(list_id, {'email' => email})
      mensaje = "#{email} suscrito correctamente"
      return
    rescue Mailchimp::ListAlreadySubscribedError
      mensaje = "#{email} ya está suscrito a la lista"
      return
    rescue Mailchimp::ListDoesNotExistError
      mensaje = "No se pudo conseguir la lista"
      #redirect_to "/lists/"
      return
    rescue Mailchimp::Error => ex
      if ex.message
        mensaje = ex.message
      else
        mensaje = "Ha ocurrido un error desconocido"
      end
    end
    logger.debug(mensaje)
    puts("mensaje - "+mensaje)
    #redirect_to "/lists/#{list_id}"
    respond_to do |format|
      if flash[:success]
        format.json { render :json => { tipo_mensaje: :success, mensaje: mensaje}}
      elsif flash[:warning]
        format.json { render :json => { tipo_mensaje: :warning, mensaje: mensaje}}
      else
        format.json { render :json => { tipo_mensaje: :error, mensaje: mensaje}}
      end
    end
  end
  
  def self.unsubscribe(email,lista)
    @mc = Mailchimp::API.new(MAILCHIMP_API_KEY)
    case lista
    when 'solicitantes'
      list_id = 'd503ae082d'
    when 'proveedores'
      list_id = '6769b54e06'
    end
    begin
      @mc.lists.unsubscribe(list_id, {'email' => email})
      mensaje = "#{email} desuscrito correctamente"
      return
    rescue Mailchimp::ListNotSubscribedError
      mensaje = "#{email} no suscrito a la lista"
      return
    rescue Mailchimp::ListDoesNotExistError
      mensaje = "No se pudo conseguir la lista"
      #redirect_to "/lists/"
      return
    rescue Mailchimp::Error => ex
      if ex.message
        mensaje = ex.message
      else
        mensaje = "Ha ocurrido un error desconocido"
      end
    end
    logger.debug(mensaje)
    puts("mensaje - "+mensaje)
    #redirect_to "/lists/#{list_id}"
    respond_to do |format|
      if flash[:success]
        format.json { render :json => { tipo_mensaje: :success, mensaje: mensaje}}
      elsif flash[:warning]
        format.json { render :json => { tipo_mensaje: :warning, mensaje: mensaje}}
      else
        format.json { render :json => { tipo_mensaje: :error, mensaje: mensaje}}
      end
    end
  end
end
