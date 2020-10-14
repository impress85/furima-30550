class ApplicationController < ActionController::Base
  before_action :configure_parmitted_parameters, if: :devise_controller?


  private
  def configure_parmitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :first_name_katakana, :family_name, :family_name_katakana, :birthday])

end
