require 'rails_helper'

RSpec.describe Api::V1::SpecialEventsController, type: :controller do
  describe "specialEvents get#index " do
    context "when there's an event in range and on homepage" do
      before(:each) do
        event = FactoryGirl.create(:special_event)
      
        get :index
      end
      it "returns a special event  from the database" do
        special_event_response = json_response
        expect(special_event_response[:special_events].length).to eq(1)
      end
      it {should respond_with 200}
    end
    context "when there's no event in range" do
      before(:each) do 
        event = FactoryGirl.create(:special_event, start_date: 1.days.from_now, end_date: 6.days.from_now)
        get :index
      end
      it {should respond_with 204}
      
    end
    context "when there's no events marked launch screen" do
      before(:each) do 
        event = FactoryGirl.create(:special_event, launch_screen: false)
        get :index
      end
      it {should respond_with 204}
    end
    
  end
end
