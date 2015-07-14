require 'spec_helper'

RSpec.describe Api::V1::DishpicsController, type: :controller do
  describe "dish/n/dishpic GET #index" do
    before(:each) do
      dishes = []
      4.times do 
        dishes << FactoryGirl.create(:dish_with_dishpics)
      end
      get :index, {:dish_id => dishes[rand(0...3)].id}
    end
    it "returns 5 dishes from the database" do
      dishpics_response = json_response
      expect(dishpics_response[:dishpics].length).to eq(5)
    end
    it {should respond_with 200}
  end
end
