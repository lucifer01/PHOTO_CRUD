class ApplicationController < ActionController::Base

  def test
    binding.pry
  end

  protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
   #devise_parameter_sanitizer.for(:account_update) << :name
 end
 
end
