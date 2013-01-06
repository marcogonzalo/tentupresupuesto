var alternar_cargando = function(id) { $(id).toggle() }; // Intercambia visibilidad cargando
var mostrar_mensaje = function(id,tipo,mensaje) { $(id).html(mensaje).attr('class',"alert "+tipo).show() };
