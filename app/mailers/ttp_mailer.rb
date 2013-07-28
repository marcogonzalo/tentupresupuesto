class TtpMailer < ActionMailer::Base
  layout 'email' # use email.(html|text).erb as the layout
  default :from => "TenTuPresupuesto <notificaciones@tentupresupuesto.com.ve>"
  
  ###################
  ### PLANTILLAS
  ###################
  
  # notifica los datos del solicitante al proveedor
  def datos_de_solicitante_a_proveedor(trabajo,solicitante,usuarios)
    @trabajo        = trabajo
    @categoria      = trabajo.categoria.nombre
    @estado         = trabajo.estado.nombre
    @municipio      = trabajo.municipio.nombre
    @localidad      = trabajo.localidad.nombre
    @solicitante    = solicitante
    emails = usuarios.map(&:email)
    mail( :to => emails,
          :subject => "Un solicitante quiere que le contactes" )
  end
  
  # notifica la publicacion de una nueva solicitud
  def solicitud_publicada(trabajo,usuarios)
    @trabajo    = trabajo
    @categoria  = trabajo.categoria.nombre
    @estado     = trabajo.estado.nombre
    @municipio  = trabajo.municipio.nombre
    @localidad  = trabajo.localidad.nombre
    emails = usuarios.map(&:email)
    mail( :to => emails,
          :subject => "Nueva solicitud cerca de ti" )
  end

   # notifica la rececpicon de un presupuesto en un trabajo
  def presupuesto_recibido(trabajo,presupuesto,proveedor,usuarios)
    @trabajo          = trabajo.proposito
    @categoria        = trabajo.categoria.nombre
    @presupuesto      = presupuesto
    @proveedor        = proveedor.nombre_empresa
    @tipo_proveedor   = I18n.t proveedor.tipo_proveedor.to_sym, :scope => 'activerecord.attributes.proveedor.tipos_proveedor'
    emails = usuarios.map(&:email)
    mail( :to => emails,
          :subject => "Tu solicitud ha recibido una oferta" )
  end

   # notifica la rececpicon de un mensaje en un presupuesto
  def mensaje_recibido(mensaje,trabajo,presupuesto,proveedor,usuarios)
    @trabajo          = trabajo.proposito
    @categoria        = trabajo.categoria.nombre
    @presupuesto      = presupuesto
    @proveedor        = proveedor.nombre_empresa
    @mensaje          = mensaje.comentario
    @tipo             = mensaje.usuario
    emails = usuarios.map(&:email)
    mail( :to => emails,
          :subject => "Has recibido un nuevo mensaje" )
  end

   # notifica la contratacion de un presupuesto
  def presupuesto_contratado(trabajo,usuarios)
    @trabajo      = trabajo
    @direccion    = trabajo.direccion
    @solicitante  = trabajo.solicitante
    @categoria    = trabajo.categoria.nombre
    @estado       = trabajo.estado.nombre
    @municipio    = trabajo.municipio.nombre
    @localidad    = trabajo.localidad.nombre
    emails = usuarios.map(&:email)
    mail( :to => emails,
          :subject => "Tu oferta ha sido aprobada" )
  end

  # notifica la no contratacion de un presupuesto
  def presupuesto_no_contratado(trabajo,presupuesto,usuarios)
    @trabajo      = trabajo
    @categoria    = trabajo.categoria.nombre
    @estado       = trabajo.estado.nombre
    @municipio    = trabajo.municipio.nombre
    @localidad    = trabajo.localidad.nombre
    @presupuesto  = presupuesto
    emails = usuarios.map(&:email)
    mail( :to => emails,
          :subject => "Tu presupuesto no fue contratado" )
  end

  # notifica el rechazo de un presupuesto
  def presupuesto_rechazado(trabajo,presupuesto,usuarios)
    @trabajo    = trabajo.proposito
    @categoria  = trabajo.categoria.nombre
    @motivo     = I18n.t presupuesto.motivo_rechazo.to_sym, :scope => 'activerecord.attributes.presupuesto.motivos_rechazo'
    emails = usuarios.map(&:email)
    mail( :to => emails,
          :subject => "Han rechazado tu presupuesto" )
  end

  # notifica la finalizacion del trabajo
  def trabajo_finalizado(trabajo,usuarios)
    @trabajo    = trabajo.proposito
    @categoria  = trabajo.categoria.nombre
    emails = usuarios.map(&:email)
    mail( :to => emails,
          :subject => "Trabajo finalizado" )
  end
  
  
  
  ###################
  ### ACCIONES
  ###################
  
  def enviar_datos_de_solicitante_a_proveedor(presupuesto)
    # Enviar datos de contacto del solicitante al proveedor
    proveedor     = presupuesto.proveedor
    trabajo       = presupuesto.trabajo
    solicitante   = trabajo.solicitante
    
    usuarios      = Usuario.where(:perfilable_type => "Proveedor", :perfilable_id => proveedor.id)
    TtpMailer.datos_de_solicitante_a_proveedor(trabajo,solicitante,usuarios).deliver
  end
  
  def notificar_solicitud_publicada(trabajo)
    # Notificar a proveedores
    proveedores   = trabajo.categoria.proveedores.select("id")
    usuarios      = Usuario.where(:perfilable_type => "Proveedor", :perfilable_id => proveedores)
    TtpMailer.solicitud_publicada(trabajo,usuarios).deliver
  end
  
  def notificar_presupuesto_recibido(trabajo,presupuesto)
    # Notificar a solicitante
    proveedor     = presupuesto.proveedor
    trabajo       = trabajo
    usuarios      = Usuario.where(:perfilable_type => "Solicitante", :perfilable_id => trabajo.solicitante_id)
    TtpMailer.presupuesto_recibido(trabajo,presupuesto,proveedor,usuarios).deliver
  end
  
  def notificar_mensaje_recibido(mensaje)
    # Notificar a usuario
    presupuesto   = mensaje.presupuesto
    trabajo       = presupuesto.trabajo
    proveedor     = presupuesto.proveedor
    
    # Si es solicitante, enviar al proveedor
    if mensaje.usuario.eql?("Solicitante")
      tipo = "Proveedor"
      id = proveedor.id
    end
    
    # Si es proveedor, enviar al solicitante
    if mensaje.usuario.eql?("Proveedor")
      tipo = "Solicitante"
      id = trabajo.solicitante_id
    end
    usuarios     = Usuario.where(:perfilable_type => tipo, :perfilable_id => id)
    TtpMailer.mensaje_recibido(mensaje,trabajo,presupuesto,proveedor,usuarios).deliver
  end
  
  def notificar_presupuesto_contratado(presupuesto)
    # Notificar a proveedor
    trabajo       = presupuesto.trabajo
    usuarios      = Usuario.where(:perfilable_type => "Proveedor", :perfilable_id => presupuesto.proveedor_id)
    TtpMailer.presupuesto_contratado(trabajo,usuarios).deliver
  end
  
  def notificar_presupuesto_no_contratado(trabajo,presupuesto)
    # Notificar al proveedor
    trabajo       = trabajo
    usuarios      = Usuario.where(:perfilable_type => "Proveedor", :perfilable_id => presupuesto.proveedor_id)
    TtpMailer.presupuesto_no_contratado(trabajo,presupuesto,usuarios).deliver
  end
  
  def notificar_presupuesto_rechazado(presupuesto)
    # Notificar al proveedor
    trabajo       = presupuesto.trabajo
    usuarios      = Usuario.where(:perfilable_type => "Proveedor", :perfilable_id => presupuesto.proveedor_id)
    TtpMailer.presupuesto_rechazado(trabajo,presupuesto,usuarios).deliver
  end
  
  def notificar_trabajo_finalizado(trabajo)
    # Notificar al proveedor
    usuarios      = Usuario.where(:perfilable_type => "Proveedor", :perfilable_id => trabajo.contratado_id)
    TtpMailer.trabajo_finalizado(trabajo,usuarios).deliver
  end
end
