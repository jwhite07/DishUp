require 'rails_helper'

RSpec.describe Api::V1::RestaurantsController, type: :controller do
  describe "restaurants get#index " do
    before(:each) do
      restaurants = []
      4.times do 
        restaurants << FactoryGirl.create(:restaurant)
      end
      get :index
    end
    it "returns 4 dish_types from the database" do
      restaurants_response = json_response
      expect(restaurants_response[:restaurants].length).to eq(4)
    end
    it {should respond_with 200}
  end

end
