class UsersController < ApplicationController
	before_action :authenticate_user!
  
	def index
    @users = User.all
  end

  def new
  	@user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
