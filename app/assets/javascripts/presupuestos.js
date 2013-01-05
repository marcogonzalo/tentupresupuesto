jQuery(function($) {
  // create a convenient toggleLoading function
  var toggleLoading = function() { $("#loading").toggle() };

  $("#aceptar-presupuesto")
    .bind("ajax:loading",  toggleLoading)
    .bind("ajax:success", function(event, data, status, xhr) {
      mostrar_mensaje("#mensaje-ttp","alert alert-"+data.tipo_mensaje,data.mensaje)
      if(data.tipo_mensaje == "success") {
        $("#aceptar-presupuesto").addClass("disabled")
        $("#rechazar-presupuesto").addClass("disabled")
        $("#aceptar-presupuesto").removeAttr('href')
        $("#rechazar-presupuesto").removeAttr('href')
      }
      toggleLoading()
    })
    .bind("ajax:error", function(xhr, status, error) {
      mostrar_mensaje("#mensaje-ttp","alert alert-error",error)
      toggleLoading()
    });
});