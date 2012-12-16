# coding: utf-8
class PresupuestoObserver < ActiveRecord::Observer
  # Incrementar cantidad de solicitudes atendidas cuando el proveedor
  # presenta un nuevo presupuesto
  def after_save(presupuesto)
    if presupuesto.proveedor_id.present?
      Proveedor.increment_counter(:solicitudes_atendidas,presupuesto.proveedor_id)
    end
  end

  # Decrementar cantidad de solicitudes atendidas cuando el proveedor
  # elimina un presupuesto
  def after_destroy(presupuesto)
    if presupuesto.proveedor_id.present?
      Proveedor.decrement_counter(:solicitudes_atendidas,presupuesto.proveedor_id)
    end
  end
end
