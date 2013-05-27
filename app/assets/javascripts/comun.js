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
//= require twitter/bootstrap/bootstrap-collapse
//= require twitter/bootstrap/bootstrap-dropdown

jQuery(function($) {
    /* HACK para que funcionen desplegables bootstrap en dispositivos tactiles */
    $('body').on('touchstart.dropdown', '.dropdown-menu', function(e) {
        e.stopPropagation();
    });
    $('body').on('touchstart.dropdown-submenu', '.dropdown-menu a.stop', function(e) {
        e.preventDefault();
    });
    $(document).on('click', '.dropdown-menu a.go', function() {
        document.location = $(this).attr('href');
    });
    // FIN HACK DESPLEGABLES
    
    
    $(document).on('click', '.alert .close', function() {
        $('.alert').fadeOut()
    })
});

var alternar_cargando = function(id) {
    $(id).toggle()
};
// Intercambia visibilidad cargando
var mostrar_cargando = function(id) {
    $(id).fadeIn()
};
var ocultar_cargando = function(id) {
    $(id).fadeOut()
};
var mostrar_mensaje = function(id, tipo, mensaje) {
    $(id).html(mensaje).attr('class', "alert " + tipo).show()
};
