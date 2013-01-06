jQuery(function($) {
  $("#aceptar-presupuesto")
    .bind("ajax:loading",  alternar_cargando("#loading"))
    .bind("ajax:success", function(event, data, status, xhr) {
      mostrar_mensaje("#mensaje-ttp","alert alert-"+data.tipo_mensaje,data.mensaje)
      if(data.tipo_mensaje == "success") {
        $("#aceptar-presupuesto").addClass("disabled")
        $("#rechazar-presupuesto").addClass("disabled")
        $("#aceptar-presupuesto").removeAttr('href')
        $("#rechazar-presupuesto").removeAttr('href')
      }
      alternar_cargando("#loading")
    })
    .bind("ajax:error", function(xhr, status, error) {
      mostrar_mensaje("#mensaje-ttp","alert-error",error)
      alternar_cargando("#loading")
    });

  $("#rechazo-presupuesto")
    .bind("ajax:loading",  alternar_cargando("#loading"))
    .bind("ajax:success", function(event, data, status, xhr) {
      mostrar_mensaje("#mensaje-ttp","alert alert-"+data.tipo_mensaje,data.mensaje)
      if(data.tipo_mensaje == "success") {
        $("#aceptar-presupuesto").addClass("disabled")
        $("#rechazar-presupuesto").addClass("disabled")
        $("#aceptar-presupuesto").removeAttr('href')
        $("#rechazar-presupuesto").removeAttr('href')
      }
      alternar_cargando("#loading")
      $("#modal-rechazo").modal('hide')
    })
    .bind("ajax:error", function(xhr, status, error) {
      mostrar_mensaje("#mensaje-ttp","alert-error",error)
      alternar_cargando("#loading")
      $("#modal-rechazo").modal('hide')
    }); 
});