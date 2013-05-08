var cargar_entidades = function(modelo, entidad, entidad_superior) {
    mostrar_cargando("#loading" + entidad)
    $.ajax({
        url : "/ubicaciones_geograficas/get_lista_entidades.json",
        data : {
            tipo_entidad : entidad,
            entidad_superior_id : $("#" + modelo + "_" + entidad_superior + "_id").val()
        },
        type : "GET",
        dataType : "json",
        timeout : 10000,
        error : function(XMLHttpRequest, textStatus, errorThrown) {
            ocultar_cargando("#loading" + entidad)
        },
        success : function(data, status, xhr) {
            if (entidad == 'localidad') {
                $("#" + modelo + "_" + entidad + "_id").removeAttr("data-source");
                $(".typeahead").remove();
                var options = new Array();
                if (data.lista_entidades.length > 0) {
                    $.each(data.lista_entidades, function(i, item) {
                        options.push(item.nombre);
                    });
                }
                // Actualiza los valores del typeaheas
                $("#" + modelo + "_" + entidad + "_id").typeahead().data('typeahead').source = options
            } else {
                $("#" + modelo + "_" + entidad + "_id").html("");
                if (data.lista_entidades.length > 0) {
                    var options = '<option value="" selected="selected">--Selecciona--</option>';
                    $.each(data.lista_entidades, function(i, item) {
                        options += '<option value="' + item.id + '">' + item.nombre + '</option>';
                    });
                    $("#" + modelo + "_" + entidad + "_id").html(options);
                }
            }
            $("#" + modelo + "_" + entidad + "_id").removeAttr('disabled')
            ocultar_cargando("#loading" + entidad)
        }
    });
};
