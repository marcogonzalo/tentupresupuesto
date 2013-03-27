jQuery(function($) {
  $("#finalizar-trabajo")
    .bind("ajax:loading",  alternar_cargando("#loading-finalizar"))
    .bind("ajax:success", function(event, data, status, xhr) {
      mostrar_mensaje("#mensaje-ttp","alert alert-"+data.tipo_mensaje,data.mensaje)
      if(data.tipo_mensaje == "success") {
        $("#finalizar-trabajo").addClass("disabled")
        $("#finalizar-trabajo").removeAttr('href')
        $("#finalizar-trabajo").fadeOut()
      }
      ocultar_cargando("#loading-finalizar")
    })
    .bind("ajax:error", function(xhr, status, error) {
      mostrar_mensaje("#mensaje-ttp","alert-error",error)
      ocultar_cargando("#loading-finalizar")
    });
});

$('.presupuesto .boton-oferta').click(function() {
    presupuesto = $(this).data('oferta');
});