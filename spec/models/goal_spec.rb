require "rails_helper"

RSpec.describe Goal, type: :model do 

  context "associations" do
    it { should belong_to(:category) }
    it { should belong_to(:user) }
  end

  context "ordering" do
    before(:each) do
      @goal_1 = Goal.create(title:"Reupholster the old couch", user_id: 2, category_id: 1)
      @goal_2 = Goal.create(title:"Go skydiving", user_id: 3, category_id: 4)
      @goal_3 = Goal.create(title:"Dining at 360'", user_id: 1, category_id: 2)
      @goal_4 = Goal.create(title:"Ride my bike every week", user_id: 2, category_id: 1)
      @goal_5 = Goal.create(title:"Paint a picture", user_id: 3, category_id: 4)
      @goal_6 = Goal.create(title:"Visit the Louvre", user_id: 1, category_id: 2)
      @goal_7 = Goal.create(title:"Ride a horse 50 miles", user_id: 2, category_id: 1)
    end

    describe ".top_six" do
      it "retrieves six most recent goals" do
        expect(Goal.all.top_six.count).to eq(6)
        expect(Goal.all.top_six.first).to eq(@goal_7)
      end
    end
  end
end
