// Registro de trabajo
$(document).ready(function($) {// Carga de lista inicial de localidades en municipio seleccionado
    cargar_entidades('trabajo', 'localidad', 'municipio');
});

$('#trabajo_pais_id').change(function() {
    $("#trabajo_estado_id").attr('disabled', 'disabled');
    $("#trabajo_municipio_id").attr('disabled', 'disabled');
    $("#trabajo_localidad_id").attr('disabled', 'disabled');

    if ($('#trabajo_pais_id').val() != "") {
        cargar_entidades('trabajo', 'estado', 'pais');
    }
});

$('#trabajo_estado_id').change(function() {
    $("#trabajo_municipio_id").attr('disabled', 'disabled');
    $("#trabajo_localidad_id").attr('disabled', 'disabled');

    if ($('#trabajo_estado_id').val() != "") {
        cargar_entidades('trabajo', 'municipio', 'estado');
    }
});

$('#trabajo_municipio_id').change(function() {
    $("#trabajo_localidad_id").attr('disabled', 'disabled');

    $("#trabajo_localidad_id").val("");
    if ($('#trabajo_municipio_id').val() != "") {
        cargar_entidades('trabajo', 'localidad', 'municipio');
    }
});
