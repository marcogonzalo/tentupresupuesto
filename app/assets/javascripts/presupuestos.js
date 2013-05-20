jQuery(function($) {
    $("#aceptar-presupuesto").bind("ajax:loading", mostrar_cargando("#loading-aprobar-rechazar")).bind("ajax:success", function(event, data, status, xhr) {
        mostrar_mensaje("#mensaje-ttp", "alert alert-" + data.tipo_mensaje, data.mensaje)
        if (data.tipo_mensaje == "success") {
            $("#aceptar-presupuesto").addClass("disabled")
            $("#rechazar-presupuesto").addClass("disabled")
            $("#aceptar-presupuesto").removeAttr('href')
            $("#rechazar-presupuesto").removeAttr('href')
            $("#aceptar-presupuesto").fadeOut()
            $("#rechazar-presupuesto").fadeOut()
        }
        ocultar_cargando("#loading-aprobar-rechazar")
    }).bind("ajax:error", function(xhr, status, error) {
        mostrar_mensaje("#mensaje-ttp", "alert-error", error)
        ocultar_cargando("#loading-aprobar-rechazar")
    });

    $("#rechazo-presupuesto").bind("ajax:loading", mostrar_cargando(".cargando")).bind("ajax:success", function(event, data, status, xhr) {
        mostrar_mensaje("#mensaje-ttp", "alert alert-" + data.tipo_mensaje, data.mensaje)
        if (data.tipo_mensaje == "success") {
            $("#aceptar-presupuesto").addClass("disabled")
            $("#rechazar-presupuesto").addClass("disabled")
            $("#aceptar-presupuesto").removeAttr('href')
            $("#rechazar-presupuesto").removeAttr('href')
            $("#aceptar-presupuesto").fadeOut()
            $("#rechazar-presupuesto").fadeOut()
        }
        ocultar_cargando(".cargando")
        //ocultar_cargando("#loading-aprobar-rechazar")
        $("#modal-rechazo").modal('hide')
    }).bind("ajax:error", function(xhr, status, error) {
        mostrar_mensaje("#mensaje-ttp", "alert-error", error)
        ocultar_cargando(".cargando")
        //ocultar_cargando("#loading-aprobar-rechazar")
        $("#modal-rechazo").modal('hide')
    });
    ocultar_cargando(".cargando")
}); 