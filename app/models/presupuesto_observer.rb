# coding: utf-8
class PresupuestoObserver < ActiveRecord::Observer
  # Incrementar cantidad de solicitudes atendidas cuando el proveedor
  # presenta un nuevo presupuesto
  def after_create(presupuesto)
    if presupuesto.proveedor_id.present?
      Proveedor.increment_counter(:solicitudes_atendidas,presupuesto.proveedor_id)
    end
  end
  
  def after_update(presupuesto)
    if presupuesto.aprobado and presupuesto.trabajo_id.present?
      presupuestos = Presupuesto.where(:trabajo_id => presupuesto.trabajo_id, :aprobado => nil)
      presupuestos.each do |p|
        p.aprobado = false
        p.rechazado = false
        p.save
      end
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
