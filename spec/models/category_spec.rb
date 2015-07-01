require "rails_helper"

RSpec.describe Category, type: :model do 
  
  context "associations" do
    it { should have_many(:goals) }
    it { should belong_to(:user) }
  end

end 
