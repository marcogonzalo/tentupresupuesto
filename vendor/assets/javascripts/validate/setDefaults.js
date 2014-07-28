/**
 * @author Marco Gonzalo Gómez Pérez
 */
jQuery(function($) {
    jQuery.validator.setDefaults({
        errorElement : "span",
        errorClass : "help-inline message label label-important",
        errorPlacement : function(error, element) {
            $(element).closest('.control-group').find("span.message").remove();
            // Elimina cualquier mensaje de error anterior
            error.insertAfter($(element).closest('.control-group').find("label"));
            // Inserta el mensaje de error luego de la etiqueta
            $(element).removeClass('help-inline message label label-important');
            // Elimina las etiquetas de error del campo
        },
        highlight : function(element) {
            $(element).closest('.control-group').addClass('field_with_errors');
            // add the Bootstrap error class to the control group
        },
        unhighlight : function(element) {
            $(element).closest('.control-group').removeClass('field_with_errors');
            // add the Bootstrap error class to the control group
            $(element).closest('.control-group').find("span.message").remove();
            // Elimina cualquier mensaje de error anterior
        }
    });
}); 