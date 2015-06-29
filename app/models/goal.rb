class Goal < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

  def self.top_six
    Goal.last(6)
  end
end
