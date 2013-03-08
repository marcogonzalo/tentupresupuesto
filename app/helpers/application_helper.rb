module ApplicationHelper
  def mostrar_reputacion(reputacion, valoraciones, tipo = "general")
    rep = "rep-"+tipo
    if valoraciones > 0
      entero = reputacion.floor
      decimal = (reputacion-entero>=0.5)?"_5":"_0"
      estrellas = ""
      entero.times { |i| estrellas += " * " }
      if tipo == "general" or tipo == "proveedor"
        return '<div class="reputacion"><div class="'+rep+'" title="'+(reputacion.to_s)+'('+(valoraciones.to_s)+' evaluaciones)"><span class="rep'+(entero.to_s)+decimal+'"><i>'+estrellas+'</i></span></div></div>'
      else
        return '<div class="reputacion"><div class="'+rep+'" title="'+(reputacion.to_s)+'"><span class="rep'+(entero.to_s)+decimal+'"><i>'+estrellas+'</i></span></div></div>'
      end
    else
      return '<div class="reputacion"><div class="'+rep+'" title="Sin-evaluar"><span class="rep0_0"><i>Sin evaluar</i></span></div></div>'
    end
  end
  
  #Reescritura de helpers _signed_in?
  def solicitante_signed_in?
    if !!current_solicitante and current_solicitante.perfilable_type == "solicitante"
      !!current_solicitante
    else
      nil
    end
  end
  
  def proveedor_signed_in?
    if !!current_proveedor and current_proveedor.perfilable_type == "proveedor"
      !!current_proveedor
    else
      nil
    end
  end
end