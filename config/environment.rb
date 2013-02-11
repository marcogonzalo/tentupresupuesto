# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Ttp::Application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  errors = Array(instance.error_message).join(', ')
  if html_tag =~ /<(label)/
    html_tag
  else
    %(#{html_tag} <span class="label label-important">#{errors}</span> ).html_safe
  end
  
  config.action_mailer.deconfig.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => 'tentupresupuesto.com.ve',
    :user_name            => 'contacto@tentupresupuesto.com.ve',
    :password             => '1scrc0nt4ct0',
    :authentication       => 'plain',
    :enable_starttls_auto => true  
  }
end