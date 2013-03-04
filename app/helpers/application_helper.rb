module ApplicationHelper
  def mostrar_reputacion(reputacion, valoraciones, tipo = "general")
    case tipo
    when "trabajo"
      rep = "rep-trabajo"
    when "aspecto"
      rep = "rep-aspecto"
    else
      rep = "rep-proveedor"
    end
    if valoraciones > 0
      entero = reputacion.floor
      decimal = (reputacion-entero>=0.5)?"_5":"_0"
      estrellas = ""
      entero.times { |i| estrellas += " * " }
      return '<div class="reputacion"><div class="'+rep+'" title="'+(reputacion.to_s)+'('+(valoraciones.to_s)+' evaluaciones)"><span class="rep'+(entero.to_s)+decimal+'"><i>'+estrellas+'</i></span></div></div>'
    else
      return '<div class="reputacion"><div class="'+rep+'" title="Sin-evaluar"><span class="rep0_0"><i>Sin evaluar</i></span></div></div>'
    end
  end
end
