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
// require twitter/bootstrap/bootstrap-alert
//= require twitter/bootstrap/bootstrap-modal
//= require twitter/bootstrap/bootstrap-tooltip
// require twitter/bootstrap/bootstrap-typeahead
//= require comun

$(document).ready(function() {
    $('a').tooltip({
        trigger : 'focus'
    });
    $('input').tooltip({
        trigger : 'focus'
    });
    $('textarea').tooltip({
        trigger : 'focus'
    });
    $('select').tooltip({
        trigger : 'click'
    });

    var validaciones_proveedor = {
        rules : {
            "proveedor[email]" : {
                required : true,
                email : true
            },
            "proveedor[password]" : {
                required : true,
                minlength : 8
            },
            "proveedor[password_confirmation]" : {
                required : true,
                minlength : 8,
                equalTo : "#proveedor_password"
            }
        }
    };
    var validator = $("#new_proveedor").validate(validaciones_proveedor);
    
    
    var validaciones_solicitante = {
        rules : {
            "solicitante[email]" : {
                required : true,
                email : true
            },
            "solicitante[password]" : {
                required : true,
                minlength : 8
            },
            "solicitante[password_confirmation]" : {
                required : true,
                minlength : 8,
                equalTo : "#solicitante_password"
            }
        }
    };
    var validator = $("#new_solicitante").validate(validaciones_solicitante);
});
