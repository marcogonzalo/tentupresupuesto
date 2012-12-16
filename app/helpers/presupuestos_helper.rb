module PresupuestosHelper
  def mostrar_reputacion(reputacion, valoraciones, tipo = "general")
    case tipo
    when "trabajo"
      rep = "reputacion-trabajo rt"
    when "aspecto"
      rep = "reputacion-aspecto ra"
    else
      rep = "reputacion-proveedor rp"
    end
    if valoraciones > 0
      entero = reputacion.floor
      decimal = (reputacion-entero>=0.5)?"_5":"_0"
      borrar = ""
      entero.times { |i| borrar += " * " }
      return '<span class="'+rep+(entero.to_s)+decimal+'" title="'+(reputacion.to_s)+'('+(valoraciones.to_s)+' evaluaciones)"> '+borrar+'</span>'
    else
      return '<span class="'+rep+'0_0" title="Sin-evaluar">Sin evaluar</span>'
    end
  end
end
