module PresupuestosHelper
  def mostrar_reputacion(cantidad, tipo = "general")
    case tipo
    when "trabajo"
      rep = "reputacion-trabajo rt"
    when "aspecto"
      rep = "reputacion-aspecto ra"
    else
      rep = "reputacion-proveedor rp"
    end
    entero = cantidad.floor
    decimal = (cantidad-entero>=0.5)?"_5":"_0"
    borrar = ""
    entero.times { |i| borrar += " * " }
    return '<span class="'+rep+(entero.to_s)+decimal+'" title="'+(cantidad.to_s)+'"> '+borrar+'</span>'
  end
end
