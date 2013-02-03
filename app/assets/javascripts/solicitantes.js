$(document).ready(function($) { // Carga de lista inicial de localidades en municipio seleccionado
  cargar_entidades('solicitante','localidad','municipio');
});

$('#solicitante_pais_id').change(function(){
    cargar_entidades('solicitante','estado','pais');
});

$('#solicitante_estado_id').change(function(){
    cargar_entidades('solicitante','municipio','estado');
});

$('#solicitante_municipio_id').change(function(){
  $("#solicitante_localidad_id").val("");
  cargar_entidades('solicitante','localidad','municipio');
});