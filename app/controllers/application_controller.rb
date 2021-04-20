class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:dashboard]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name referred_by])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :photo, :paypal, :country, :city, :address])
  end
end
