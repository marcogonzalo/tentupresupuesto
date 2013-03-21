
// Perfil de proveedor
$('#perfil #trabajos').hide();

$('#perfil-tabs a').click(function (e) {
  e.preventDefault();
  href = $(this).attr('href');
  	switch(href) {
	    case '#informacion':
	    	$('#perfil '+href).show();
	    	$('#perfil #trabajos').hide(); 
	    	$('#titulo-pestana h3').text("Información del proveedor")
	  		break;
	    case '#trabajos':
	    	$('#perfil '+href).show();
	    	$('#perfil #informacion').hide();
	    	$('#titulo-pestana h3').text("Imágenes de trabajos")
	    	break;
	}
})