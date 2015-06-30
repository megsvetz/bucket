class AddGoalPicToGoals < ActiveRecord::Migration
  def up
    add_attachment :goals, :goal_pic
  end

  def down
    remove_attachment :goals, :goal_pic
  end
end


class Items < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.attachment :item_pic
    end
  end

  def self.down
    remove_attachment :items, :item_pic
  end
end