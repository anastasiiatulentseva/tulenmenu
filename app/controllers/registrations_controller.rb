class RegistrationsController < Devise::RegistrationsController
  
  before_action :authenticate_user!
  
  
  
  protected
  
  def update_resource(recource, params)
    resource.update_without_password(params)
  end
  
  def after_update_path_for(resource)
    user_path(resource)
  end
  
  
end