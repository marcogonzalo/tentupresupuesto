$(document).ready(function($) {// Carga de lista inicial de localidades en municipio seleccionado
	cargar_entidades('solicitante', 'localidad', 'municipio');
});

$('#solicitante_pais_id').change(function() {
	$("#solicitante_estado_id").attr('disabled', 'disabled');
	$("#solicitante_municipio_id").attr('disabled', 'disabled');
	$("#solicitante_localidad_id").attr('disabled', 'disabled');
	
	if ($('#solicitante_pais_id').val() != "") {
		cargar_entidades('solicitante', 'estado', 'pais');
	}
});

$('#solicitante_estado_id').change(function() {
	$("#solicitante_municipio_id").attr('disabled', 'disabled');
	$("#solicitante_localidad_id").attr('disabled', 'disabled');
	
	if ($('#solicitante_estado_id').val() != "") {
		cargar_entidades('solicitante', 'municipio', 'estado');
	}
});

$('#solicitante_municipio_id').change(function() {
	$("#solicitante_localidad_id").attr('disabled', 'disabled');
	
	$("#solicitante_localidad_id").val("");
	if ($('#solicitante_municipio_id').val() != "") {
		cargar_entidades('solicitante', 'localidad', 'municipio');
	}
}); 