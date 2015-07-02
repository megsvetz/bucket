require 'rails_helper'

RSpec.describe Identity, type: :model do
  context "associations" do
    it { should belong_to ( :user ) }
    it { should validate_presence_of ( :uid ) }
    it { should validate_uniqueness_of ( :uid ) }
  end
  #
  # context "class methods" do
  #   describe ".find_for_twitter_oauth" do
  #   end
  # end

end
