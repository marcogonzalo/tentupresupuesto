# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Ttp::Application.initialize!

# ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
#   errors = Array(instance.error_message).join(', ')
#   if html_tag =~ /<(label)/
#     html_tag
#   else
#     %(#{html_tag} <span class="help-block label label-important">#{errors}</span> ).html_safe
#   end
# end

ActionMailer::Base.smtp_settings = {
  :user_name => "tentupresupuesto",
  :password => "n1cKhl40St",
  :domain => "www.tentupresupuesto.com.ve",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
#    :address              => "smtp.gmail.com",
#    :port                 => 587,
#    :domain               => 'google.com',
#    :user_name            => 'contacto@tentupresupuesto.com.ve',
#    :password             => '1scrc0nt4ct0',
#    :authentication       => 'plain',
#    :enable_starttls_auto => true
}