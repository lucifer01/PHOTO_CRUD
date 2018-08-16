class ApplicationController < ActionController::Base

  protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
   #devise_parameter_sanitizer.for(:account_update) << :name
 end
 
end
