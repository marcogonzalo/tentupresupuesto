class TtpMailer < ActionMailer::Base
  layout 'email' # use email.(html|text).erb as the layout
  default :from => "notificaciones@tentupresupuesto.com.ve"
  
  ###################
  ### PLANTILLAS
  ###################
  
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
    @tipo_proveedor   = proveedor.tipo_proveedor
    emails = usuarios.map(&:email)
    mail( :to => emails,
          :subject => "Tu solicitud ha recibido una oferta" )
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
    @trabajo    = trabajo
    @categoria  = trabajo.categoria.nombre
    @estado     = trabajo.estado.nombre
    @municipio  = trabajo.municipio.nombre
    @localidad  = trabajo.localidad.nombre
    @presupuesto      = presupuesto
    emails = usuarios.map(&:email)
    mail( :to => emails,
          :subject => "Tu presupuesto no fue contratado" )
  end

  # notifica el rechazo de un presupuesto
  def presupuesto_rechazado(trabajo,presupuesto,usuarios)
    @trabajo    = trabajo
    @categoria  = trabajo.categoria.nombre
    @motivo     = presupuesto.motivo_rechazo
    emails = usuarios.map(&:email)
    mail( :to => emails,
          :subject => "Han rechazado tu presupuesto" )
  end
  
  
  
  ###################
  ### ACCIONES
  ###################
  
  def notificar_solicitud_publicada(trabajo)
    # Notificar a proveedores
    proveedores   = trabajo.categoria.proveedores.select("id")
    usuarios      = Usuario.where(:perfilable_type => "proveedor", :perfilable_id => proveedores)
    TtpMailer.solicitud_publicada(trabajo,usuarios).deliver
  end
  
  def notificar_presupuesto_recibido(trabajo,presupuesto)
    # Notificar a proveedores
    proveedor     = presupuesto.proveedor
    trabajo       = trabajo
    usuarios      = Usuario.where(:perfilable_type => "solicitante", :perfilable_id => trabajo.solicitante_id)
    TtpMailer.presupuesto_recibido(trabajo,presupuesto,proveedor,usuarios).deliver
  end
  
  def notificar_presupuesto_contratado(presupuesto)
    # Notificar al proveedor
    trabajo       = presupuesto.trabajo
    usuarios      = Usuario.where(:perfilable_type => "proveedor", :perfilable_id => presupuesto.proveedor_id)
    TtpMailer.presupuesto_contratado(trabajo,usuarios).deliver
  end
  
  def notificar_presupuesto_no_contratado(trabajo,presupuesto)
    # Notificar al proveedor
    trabajo       = trabajo
    usuarios      = Usuario.where(:perfilable_type => "proveedor", :perfilable_id => presupuesto.proveedor_id)
    TtpMailer.presupuesto_no_contratado(trabajo,presupuesto,usuarios).deliver
  end
  
  def notificar_presupuesto_rechazado(presupuesto)
    # Notificar al proveedor
    trabajo       = presupuesto.trabajo
    usuarios      = Usuario.where(:perfilable_type => "proveedor", :perfilable_id => presupuesto.proveedor_id)
    TtpMailer.presupuesto_rechazado(trabajo,presupuesto,usuarios).deliver
  end
end
