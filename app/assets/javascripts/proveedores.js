$(document).ready(function($) { // Carga de lista inicial de localidades en municipio seleccionado
  cargar_entidades('proveedor','localidad','municipio');
});

$('#proveedor_pais_id').change(function(){
    cargar_entidades('proveedor','estado','pais');
});

$('#proveedor_estado_id').change(function(){
    cargar_entidades('proveedor','municipio','estado');
});

$('#proveedor_municipio_id').change(function(){
  $("#proveedor_localidad_id").val("");
    cargar_entidades('proveedor','localidad','municipio');
});