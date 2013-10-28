jQuery(function($) {
    
    //$(".proveedor-interesado").ellipsis();
    
    $("#finalizar-trabajo-modal").click(function() {
        $("#finalizar-trabajo-modal").addClass("disabled")
        $("#finalizacion-trabajo").bind("ajax:loading", mostrar_cargando(".cargando")).bind("ajax:complete", function(event, data, status, xhr) {
            if(typeof data.responseText === 'undefined')
                r = data
            else
                r = jQuery.parseJSON(data.responseText)
            if (r.tipo_mensaje == "success") {
                
                //$("#finalizar-trabajo").removeAttr('data-method')
                //$("#finalizar-trabajo").removeAttr('data-remote')
                /*$("#finalizar-trabajo").attr('id', 'evaluar-trabajo')
                $("#evaluar-trabajo").attr('href', '/trabajos/' + r.trabajo.slug + '/evaluar')
                $("#evaluar-trabajo").text('Evaluar trabajo')
                $("#evaluar-trabajo").removeClass("btn-success")
                $("#evaluar-trabajo").addClass("btn-warning")*/
                //$("#evaluar-trabajo").removeClass("disabled")
                $("#modal-finalizado").modal('hide')
            } 
            mostrar_mensaje("#mensaje-ttp", "alert-success", r.mensaje)
            ocultar_cargando(".cargando")
        }).bind("ajax:error", function(xhr, status, error) {
            mostrar_mensaje("#mensaje-ttp", "alert-error", error)
            ocultar_cargando(".cargando")
        });
        $("#finalizar-trabajo-modal").removeClass("disabled")
    });
});

$('.presupuesto .boton-oferta').click(function() {
    presupuesto = $(this).data('oferta');
});
