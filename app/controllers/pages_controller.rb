class PagesController < ApplicationController
	def home
    # @name = User.find_by(id: goal.user_id)
    @goals = Goal.top_six
    @users = User.all
	end
end
