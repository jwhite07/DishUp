require 'spec_helper'

RSpec.describe Api::V1::DishTypesController, type: :controller do
  #render_views
  describe "GET #index" do
    before(:each) do
      4.times do 
        FactoryGirl.create :dish_type_with_dishes
      end
      get :index
    end
    it "returns 4 dish_types from the database" do
      dish_types_response = json_response
      #puts dish_types_response
      expect(dish_types_response[:dish_types][0].length).to eq(4)
    end
    it {should respond_with 200}
  end
end
