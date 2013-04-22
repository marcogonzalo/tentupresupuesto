# coding: utf-8
class TrabajoObserver < ActiveRecord::Observer
  # Incrementar cantidad de solicitudes realizadas cuando el solicitante
  # crea un nuevo trabajo
  def after_create(trabajo)
    if trabajo.solicitante_id.present?
      Solicitante.increment_counter(:solicitudes_realizadas,trabajo.solicitante_id)
      Categoria.increment_counter(:trabajos_asociados,trabajo.categoria_id)
    end
  end

  # Incrementar cantidad de trabajos_recibidos de un solicitante y
  # trabajos_realizados por un proveedor, cuando el trabajo finaliza
  def after_update(trabajo)
    # Si se cambia a estado de finalizado
    if trabajo.finalizado?
      Solicitante.increment_counter(:trabajos_recibidos,trabajo.solicitante_id)
      Proveedor.increment_counter(:trabajos_realizados,trabajo.contratado_id)
    end
  end

  # Decrementar cantidad de solicitudes realizadas cuando el solicitante
  # elimina un trabajo
  def after_destroy(trabajo)
    if trabajo.solicitante_id.present?
      Solicitante.decrement_counter(:solicitudes_realizadas,trabajo.solicitante_id)
      Categoria.decrement_counter(:trabajos_asociados,trabajo.categoria_id)
    end
  end
end
