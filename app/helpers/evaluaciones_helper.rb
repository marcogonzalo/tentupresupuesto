module EvaluacionesHelper
  def mostrar_reputacion(reputacion, valoraciones, tipo = "general")
    rep = "rep-"+tipo
    reputacion = reputacion.nil? ? 0 : reputacion
    if valoraciones > 0
      entero = reputacion.round
      reputacion = reputacion.round(2)
      
      ancho = 'width:'+((reputacion/5.0)*100).to_s+'%'
      estrellas = ""
      entero.times { |i| estrellas += " * " }
      if tipo == "general" or tipo == "proveedor"
        return '<div class="reputacion"><div class="'+rep+'" title="'+number_with_delimiter(reputacion)+' ('+t('extras.valoraciones', :count => valoraciones)+')"><span style="'+ancho+'"><i>'+estrellas+'</i></span></div></div>'
      else
        # Valoraciones individuales (trabajo)
        return '<div class="reputacion"><div class="'+rep+'" title="'+number_with_delimiter(reputacion)+'"><span style="'+ancho+'"><i>'+estrellas+'</i></span></div></div>'
      end
    else
      if tipo == "proveedor"
        return '' #'<div class="reputacion"><span class="sin-evaluar">Sin evaluaciones</span></div>'
      else
        return '<div class="reputacion"><div class="'+rep+'" title="Sin evaluar"><span style="width:0%;"><i>Sin evaluar</i></span></div></div>'
      end
    end
  end
  
end
