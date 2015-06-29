class GoalsController < ApplicationController
  before_action :find_goal, only: [:edit, :update, :show, :destroy]
  
  def index
    @user = current_user
    @goals = Goal.all
  end

  def show
  end

  def new
    @user = current_user
    @goal = Goal.new
  end

  def create
    @goal = Goal.create(goal_params)
    if @goal.save
      flash[:notice]="Goal was created succesfully!"
      redirect_to(goals_path)
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
      redirect_to(goals_path)
    else
      flash[:error]="Goal was not updated."
      render :edit
    end
  end

  def destroy
    if @goal.destroy
      flash[:alert]="Goal was successfully deleted!"
    end
    redirect_to(goals_path)
  end

private
  def goal_params
    params.require(:goal).permit(:title, :completed, :category_id, :goal_pic, :user_id)
  end

  def find_goal
    @goal = Goal.find_by(id: params[:id])
    unless @goal
      render(text: "Goal not found.", status: :not_found)
    end
  end
end
