require 'spec_helper'

RSpec.describe Api::V1::DishTypesController, type: :controller do
  #render_views
  describe "GET #index" do
    before(:each) do
      types = ["Burgers", "Pasta", "Seafood", "Steak"]
      types.each do |t|
        FactoryGirl.create :dish_type, name: t
      end
      get :index
    end
    it "returns 4 dish_types from the database" do
      dish_types_response = json_response
      expect(dish_types_response[:dish_types].length).to eq(4)
    end
    it {should respond_with 200}
  end
end
