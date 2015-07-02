class PagesController < ApplicationController

	def home
	  # @name = User.find_by(id: goal.user_id)
	  # @goals = Goal.top_six
	  @goals = Goal.all
	  @users = User.all
	  @goals = Goal.order(updated_at: :desc).paginate(:page => params[:page], :per_page => 6)
	end
end
