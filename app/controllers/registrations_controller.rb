class RegistrationsController < Devise::RegistrationsController
    before_filter :update_sanitized_params, if: :devise_controller?

    private
    def update_sanitized_params
       devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :bio, :password, :password_confirmation, :avatar)}
    end
end
