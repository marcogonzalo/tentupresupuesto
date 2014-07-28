// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require validate/jquery.validate.min.js
//= require validate/localization/messages_es.js
//= require validate/setDefaults.js
//= require twitter/bootstrap/bootstrap-alert
//= require twitter/bootstrap/bootstrap-modal
//= require twitter/bootstrap/bootstrap-tooltip
//= require twitter/bootstrap/bootstrap-transition
//= require twitter/bootstrap/bootstrap-typeahead
//= require comun

$(document).ready(function () {
  $('a.tltip').tooltip({trigger:'hover'});
  $('input').tooltip({trigger:'focus'});
  $('textarea').tooltip({trigger:'focus'});
  $('select').tooltip({trigger:'click'});
  
  var validaciones_solicitante = {
        rules : {
            "solicitante[nombre_persona]" : {
                required : true,
                rangelength: [3, 50]
            },
            "solicitante[telefono_movil]" : {
                digits: true,
                minlength : 8
            },
            "solicitante[telefono_local]" : {
                digits: true,
                minlength : 8
            },
            "solicitante[telefono_alt]" : {
                digits: true,
                minlength : 8
            },
            "solicitante[pais_id]" : {
                required : true
            },
            "solicitante[estado_id]" : {
                required : true
            },
            "solicitante[municipio_id]" : {
                required : true
            },
            "solicitante[localidad_id]" : {
                required : true,
                rangelength: [3, 50]
            },
            "solicitante[direccion]" : {
                rangelength: [5, 255]
            },
            "solicitante[punto_referencia]" : {
                rangelength: [3, 50]
            }
        }
    };
    var validator = $(".edit_solicitante").validate(validaciones_solicitante);
    var validator = $(".new_solicitante").validate(validaciones_solicitante);
  
    var validaciones_proveedor = {
        rules : {
            "proveedor[nombre_empresa]" : {
                required : true,
                rangelength: [3, 50]
            },
            "proveedor[tipo_proveedor]" : {
                required : true
            },
            "proveedor[descripcion]" : {
                required : true
            },
            "proveedor[nombre_persona]" : {
                required : true,
                rangelength: [3, 50]
            },
            "proveedor[telefono_movil]" : {
                digits: true,
                minlength : 8
            },
            "proveedor[telefono_local]" : {
                digits: true,
                minlength : 8
            },
            "proveedor[telefono_alt]" : {
                digits: true,
                minlength : 8
            },
            "proveedor[pais_id]" : {
                required : true
            },
            "proveedor[estado_id]" : {
                required : true
            },
            "proveedor[municipio_id]" : {
                required : true
            },
            "proveedor[localidad_id]" : {
                required : true,
                rangelength: [3, 50]
            },
            "proveedor[direccion]" : {
                rangelength: [5, 255]
            },
            "proveedor[punto_referencia]" : {
                rangelength: [3, 50]
            }
        }
    };
    var validator = $(".edit_proveedor").validate(validaciones_proveedor);
    var validator = $(".new_proveedor").validate(validaciones_proveedor);
});