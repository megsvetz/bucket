class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_sign_up_permitted_parameters, if: :devise_controller?
  before_action :configure_sign_in_permitted_parameters, if: :devise_controller?

  def configure_sign_up_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) << :username
     devise_parameter_sanitizer.for(:sign_up) << :bio
     devise_parameter_sanitizer.for(:sign_up) << :avatar
     devise_parameter_sanitizer.for(:sign_up) << :email
     devise_parameter_sanitizer.for(:sign_up) << :password
     devise_parameter_sanitizer.for(:sign_up) << :password_confirmation

  end

  def configure_sign_in_permitted_parameters
     devise_parameter_sanitizer.for(:sign_in) << :username
     devise_parameter_sanitizer.for(:sign_in) << :bio
     devise_parameter_sanitizer.for(:sign_in) << :email
     devise_parameter_sanitizer.for(:sign_in) << :avatar
     devise_parameter_sanitizer.for(:sign_up) << :password
     devise_parameter_sanitizer.for(:sign_up) << :password_confirmation
  end

end
