jQuery(function($) {
	$("#finalizar-trabajo").click(function() {
		$("#finalizar-trabajo").addClass("disabled")
		$("#finalizar-trabajo")
		.bind("ajax:loading", mostrar_cargando("#loading-trabajo"))
		.bind("ajax:success", function(event, data, status, xhr) {
			mostrar_mensaje("#mensaje-ttp", "alert alert-" + data.tipo_mensaje, data.mensaje)
			if (data.tipo_mensaje == "success") {
				$("#finalizar-trabajo").removeAttr('data-method')
				$("#finalizar-trabajo").removeAttr('data-remote')
				$("#finalizar-trabajo").attr('id','evaluar-trabajo')
				$("#evaluar-trabajo").attr('href','/trabajos/'+data.trabajo.slug+'/evaluar')
				$("#evaluar-trabajo").text('Evaluar trabajo')
				$("#evaluar-trabajo").removeClass("btn-success")
				$("#evaluar-trabajo").addClass("btn-warning")
			}
			$("#evaluar-trabajo").removeClass("disabled")
			ocultar_cargando("#loading-trabajo")
			})
		.bind("ajax:error", function(xhr, status, error) {
			mostrar_mensaje("#mensaje-ttp", "alert-error", error)
			$("#evaluar-trabajo").removeClass("disabled")
			ocultar_cargando("#loading-trabajo")
		});
	});
});

$('.presupuesto .boton-oferta').click(function() {
	presupuesto = $(this).data('oferta');
}); 