class AddGoalPicToGoals < ActiveRecord::Migration
  def up
    add_attachment :goals, :goal_pic
  end

  def down
    remove_attachment :goals, :goal_pic
  end
end
