require 'rails_helper'

RSpec.describe Api::V1::LocationsController, type: :controller do
  describe "locations get#index " do
    before(:each) do
      locations = []
      4.times do 
        locations << FactoryGirl.create(:location_with_restaurant)
      end
      get :index
    end
    it "returns 4 locations from the database" do
      location_response = json_response
      expect(location_response[:locations].length).to eq(4)
    end
    it {should respond_with 200}
    
  end
  describe "special_events/n/locations GET #index" do
    before(:each) do
      special_events = []
      4.times do 
        special_events << FactoryGirl.create(:special_event_with_menus)
      end
      get :index, {:special_event_id => special_events[rand(0...3)].id}
    end
    it "returns 4 restaurants from the database" do
      locations_response = json_response
     
      expect(locations_response[:locations].length).to eq(4)
    end
    it {should respond_with 200}
  end
end
