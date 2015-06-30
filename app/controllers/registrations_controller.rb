class RegistrationsController < Devise::RegistrationsController
    before_filter :update_sanitized_params, if: :devise_controller?

  # def create
  #   @user = User.find_or_create_from_auth_hash(auth_hash)
  #   self.current_user = @user
  #   redirect_to '/'
  # end

	def create
	  auth_hash = request.env['omniauth.auth']
	 
	  render :text => auth_hash.inspect
	end
  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  private
  def update_sanitized_params
     devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :bio, :password, :password_confirmation, :avatar)}
  end
end
