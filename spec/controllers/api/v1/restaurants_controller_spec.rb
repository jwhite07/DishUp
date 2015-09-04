require 'rails_helper'

RSpec.describe Api::V1::RestaurantsController, type: :controller do
  describe "restaurants get#index " do
    before(:each) do
      restaurants = []
      4.times do 
        restaurants << FactoryGirl.create(:restaurant_with_dishes)
      end
      get :index
    end
    it "returns 4 dish_types from the database" do
      restaurants_response = json_response
      expect(restaurants_response[:restaurants].length).to eq(4)
    end
    it {should respond_with 200}
    
  end
  describe "special_events/n/restaurants GET #index" do
    before(:each) do
      special_events = []
      4.times do 
        special_events << FactoryGirl.create(:special_event_with_menus)
      end
      get :index, {:special_event_id => special_events[rand(0...3)].id}
    end
    it "returns 4 restaurants from the database" do
      restaurants_response = json_response
      expect(restaurants_response[:restaurants].length).to eq(4)
    end
    it {should respond_with 200}
  end

end
