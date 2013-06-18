# coding: utf-8
class EvaluacionObserver < ActiveRecord::Observer
  # Incrementar cantidad de evaluaciones recibidas por el proveedor
  # cuando el solicitante crea una nueva evaluacion
  def after_create(evaluacion)
    if evaluacion.proveedor_id.present?
      p = Proveedor.find(evaluacion.proveedor_id)
      e = Evaluacion.where(:proveedor_id => p.id)
      
      t = evaluacion.trabajo
      t.estatus = "evaluado"
      t.save
      
      valoraciones = e.count
      reputacion = e.average("total")
      p.valoraciones = valoraciones
      p.reputacion = reputacion
      p.save
      
      #puts p.errors.full_messages.to_sentence
    end
  end
end
