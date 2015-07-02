require 'rails_helper'

RSpec.describe PagesController, type: :controller do

	let(:user) {User.create(username: "girl", email: "girl@example.com", password: "password")}

  describe "GET #home" do
   	it "returns http success" do
	    get :home
	    expect(response).to have_http_status(:success)
   	end

   	it "returns all users"do 
   		user
   		expect(User.first.username).to eq("girl")
   	end
  end
end
