require 'rails_helper'

RSpec.describe User, type: :model do
  context "associations" do
    it { should have_many(:categories) }
    it { should have_many(:goals) }
  end

  context "class methods" do
    describe ".find_for_twitter_oauth" do
    end
  end

end
