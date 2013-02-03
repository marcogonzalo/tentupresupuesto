var cargar_entidades = function(modelo,entidad,entidad_superior) {
  $("#"+modelo+"_"+entidad+"_id").html("");
  mostrar_cargando("#loading"+entidad)
  $.ajax({
    url: "/ubicacion_geografica/get_lista_entidades.json",
    data:{
      tipo_entidad: entidad,
      entidad_superior_id: $("#"+modelo+"_"+entidad_superior+"_id").val()
    },
    type: "GET",
    dataType: "json",
    timeout:10000,
    error: function(XMLHttpRequest, textStatus, errorThrown){
      //showErrorMessageRegister('error_register', 'error_register p', 'Error de comunicaci&oacute;n con el servidor. Por favor, vuelve a intentarlo');
      //$('#loader_'+element).fadeOut();
      ocultar_cargando("#loading"+entidad)
    },
    success: function(data, status, xhr){
      $("#"+modelo+"_localidad_id").val("");
      if(entidad == 'localidad') {
        $("#"+modelo+"_"+entidad+"_id").removeAttr("data-source");
        $(".typeahead").remove();
        var options = new Array();
        if (data.lista_entidades.length > 0) {
          $.each(data.lista_entidades, function(i, item){
            options.push(item.nombre);
          });
        }
        // Actualiza los valores del typeaheas
        $("#"+modelo+"_"+entidad+"_id").typeahead().data('typeahead').source = options
        
        ocultar_cargando("#loading"+entidad)
      }
      else 
      {
        if (data.lista_entidades.length > 0){    
          var options = '<option value="" selected="selected">--Selecciona--</option>';
          $.each(data.lista_entidades, function(i, item){
            options += '<option value="'+item.id+'">'+item.nombre+'</option>';
          });
          $("#"+modelo+"_"+entidad+"_id").html(options);
        }
        ocultar_cargando("#loading"+entidad)
      }
    }
  });
  ocultar_cargando("#loading"+tipo_entidad)
};

$('#proveedor_pais_id').change(function(){

    cargar_entidades('proveedor','estado','pais');

});

$('#proveedor_estado_id').change(function(){
  
    cargar_entidades('proveedor','municipio','estado');

});

$('#proveedor_municipio_id').change(function(){

    cargar_entidades('proveedor','localidad','municipio');

});