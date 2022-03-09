class ApplicationController < ActionController::Base
  # protect_from_forgery prepend: true
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?

  # before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :email, :password, :current_password)}
  end



  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :password, :password_confirmation])
  # end
end

