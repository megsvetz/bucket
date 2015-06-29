class Goal < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
  has_attached_file :goal_pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :goal_pic, :content_type => /\Aimage\/.*\Z/
  

  def self.top_six
    Goal.last(6)
  end
end
