class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
    @users = User.all
		@categories = Category.order(created_at: :desc)
  end

  def new
  	@user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
    @categories = Category.all
  end

end
