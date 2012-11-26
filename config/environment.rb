# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Ttp::Application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  errors = Array(instance.error_message).join(', ')
  if html_tag =~ /<(label)/
    html_tag
  else
    %(#{html_tag}<span class="error-campo">#{errors}</span>&nbsp;).html_safe
  end
end