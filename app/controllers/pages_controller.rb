class PagesController < ApplicationController

	def home
	  # @name = User.find_by(id: goal.user_id)
	  # @goals = Goal.top_six
	  @goals = Goal.all
	  @users = User.all

	  config = {
	    consumer_key: ENV['key'],
	    consumer_secret: ENV['secret'],
	    access_token: ENV['token'],
	    access_token_secret: ENV['token_secret']
	  }

	  client = Twitter::REST::Client.new(config)
	  # @tweets = client.get_all_tweets('doyilee')
	  user = client.user('doyilee')

	  @goals = Goal.order(updated_at: :desc).paginate(:page => params[:page], :per_page => 6)

	end
end
