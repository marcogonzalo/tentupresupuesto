jQuery(function($) {
/* HACK para que funcionen desplegables bootstrap en dispositivos tactiles */
  $('body').on('touchstart.dropdown', '.dropdown-menu', function (e) {
      e.stopPropagation();
  });
  $('body').on('touchstart.dropdown-submenu', '.dropdown-menu a.stop', function (e) {
      e.preventDefault();
  });
  $(document).on('click', '.dropdown-menu a.go', function () {
      document.location = $(this).attr('href');
  });
// FIN HACK DESPLEGABLES
});

var alternar_cargando = function(id) { $(id).toggle() }; // Intercambia visibilidad cargando
var mostrar_cargando = function(id) { $(id).fadeIn() };
var ocultar_cargando = function(id) { $(id).fadeOut() };
var mostrar_mensaje = function(id,tipo,mensaje) { $(id).html(mensaje).attr('class',"alert "+tipo).show() };
