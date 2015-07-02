require 'rails_helper'

RSpec.describe GoalsController, type: :controller do

  describe "#goal index" do
  	before :each do
  	end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns all goals of category" do 
    	
    end
  end
end
