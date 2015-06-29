class UsersController < ApplicationController
	before_action :authenticate_user!
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
