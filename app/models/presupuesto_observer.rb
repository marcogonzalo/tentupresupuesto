# coding: utf-8
class PresupuestoObserver < ActiveRecord::Observer
  # Incrementar cantidad de solicitudes atendidas cuando el proveedor
  # presenta un nuevo presupuesto
  def after_create(presupuesto)
    if presupuesto.proveedor_id.present?
      Proveedor.increment_counter(:solicitudes_atendidas,presupuesto.proveedor_id)
    end
    if presupuesto.proveedor_id.present?
      Trabajo.increment_counter(:cant_presupuestos,presupuesto.trabajo_id)
    end
  end
  
  def after_update(presupuesto)
    if presupuesto.aprobado and presupuesto.trabajo_id.present?
      t = presupuesto.trabajo
      t.estatus = "ejecutando"
      t.contratado_id = presupuesto.proveedor_id
      t.save
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
    if presupuesto.proveedor_id.present?
      Trabajo.decrement_counter(:cant_presupuestos,presupuesto.trabajo_id)
    end
  end
end
