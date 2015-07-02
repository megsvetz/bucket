require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

	let(:category) {Category.create(name: "Summer")}
	let(:goal) {Goal.create(title: "sky diving", category_id: 1)}

  describe "ordering" do
    it "returns newest category" do
    @new_category = Category.create(name: "Fall")
		 expect(Category.order(updated_at: :desc).first.name).to eq("Fall")
		end
  end

  describe "GET #index" do
   	it "returns http success" do
	    get :index
	    expect(response).to have_http_status(:success)
   	end
	end

	describe "GET #show" do
    it "returns http success" do
      get :show, id: category.id
      expect(response).to have_http_status(:success)
    end

    it "does not return http success" do
      get :show, id: 2
      expect(response).to_not have_http_status(:success)
      expect(response.status).to eq(404)
    end
  end
end
