class GoalsController < ApplicationController
  before_action :find_goal, only: [:edit, :update, :show, :destroy]
  before_action :find_category, except: [:completed, :subregion]
  before_action :authenticate_user! 
  skip_before_action :verify_authenticity_token, only: :completed
 
  def index
    @goals = @category.goals
  end

  def show
    state_code = @goal.state_code if @goal.state_code 
    @location = Geocoder.search(state_code)
    @hash = Gmaps4rails.build_markers(@users) do |goal, marker|
      marker.lat goal.latitude
      marker.lng goal.longitude
    end
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal=Goal.create(goal_params)
    if @goal.save
      flash[:notice]="Goal was created succesfully!"
      redirect_to(category_goals_path)
    else
      flash[:error]="Goal was not created."
      render :new
    end
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      flash[:notice]="Goal was updated successfully!"
      redirect_to(category_goals_path)
    else
      flash[:error]="Goal was not updated."
      render :edit
    end
  end

  def destroy
    if @goal.destroy
      flash[:alert]="Goal was successfully deleted!"
    end
    redirect_to(category_goals_path)
  end

  def completed
    goal = Goal.find(params[:goal_id])
    # TODO: commented out until facebook gem is working
    # client.update(params[:twitter_body]) if params[:post_to_twitter]
    if goal.update(completed: params[:checked])
      render(nothing: true)
    else
      render(json: {message: "Sorry it didn't work."}, status: 500)
    end
  end

  def subregion
    render partial: 'shared/subregion_select'
  end

private
  def goal_params
    params.require(:goal).permit(:title, :completed, :category_id, :goal_pic, :user_id, :state_code, :country_code)
  end

  def find_goal
    @goal = Goal.find_by(id: params[:id])
    unless @goal
      render(text: "Goal not found.", status: :not_found)
    end
  end

  def find_category
    @category = Category.find(params[:category_id])
  end
end
