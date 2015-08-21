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
end
