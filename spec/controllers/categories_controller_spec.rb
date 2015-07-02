require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
	context "ordering" do
    let(:category) {Category.create(name: "Summer")}
  	end
	  describe "#index" do
	    it "returns recently updated bucket" do
	      put :update, id: category.id, category: {name: "Fall"}
			  expect(Category.first.name).to eq("Fall")
			end
	  end
	end
end