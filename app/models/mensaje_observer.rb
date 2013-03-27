# coding: utf-8
class MensajeObserver < ActiveRecord::Observer
  # Incrementar cantidad de mensajes del presupuesto
  # cuando se envia un mensaje
  def after_create(mensaje)
    if mensaje.presupuesto_id.present?
      Presupuesto.increment_counter(:cant_mensajes,mensaje.presupuesto_id)
    end
  end

  # Decrementar cantidad de mensajes del presupuesto  
  # cuand se elimina un mensaje
  def after_destroy(mensaje)
    if mensaje.presupuesto_id.present?
      Presupuesto.decrement_counter(:cant_mensajes,mensaje.presupuesto_id)
    end
  end
end
