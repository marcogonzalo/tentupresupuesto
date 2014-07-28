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

    var validaciones_usuario = {
        rules : {
            "usuario[email]" : {
                required : true,
                email : true
            },
            "usuario[password]" : {
                required : true,
                minlength : 8
            },
            "usuario[password_confirmation]" : {
                required : true,
                minlength : 8,
                equalTo : "#usuario_password"
            }
        }
    };
    var validator = $("#new_usuario").validate(validaciones_usuario);
});
