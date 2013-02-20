class ConfirmationsController < Devise::ConfirmationsController
  def show
    self.resource = resource_class.find_by_confirmation_token(params[:confirmation_token])
    super if resource.nil? or resource.confirmed?
  end

  def confirm
    self.resource = resource_class.find_by_confirmation_token(params[resource_name][:confirmation_token])
    if params[resource_name][:password].eql?(params[resource_name][:password_confirmation])
      if resource.update_attributes(params[resource_name].except(:confirmation_token))
        self.resource = resource_class.confirm_by_token(params[resource_name][:confirmation_token])
        set_flash_message :notice, :confirmed
        sign_in_and_redirect(resource_name, resource)
      else 
        render :action => "show"
      end
    else
      render :action => "show"
    end
  end
end