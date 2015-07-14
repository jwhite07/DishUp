require 'spec_helper'

RSpec.describe Api::V1::DishesController, type: :controller do
  describe "dish_type/n/dishes GET #index" do
    before(:each) do
      dish_types = []
      4.times do 
        dish_types << FactoryGirl.create(:dish_type_with_dishes)
      end
      get :index, {:dish_type_id => dish_types[rand(0...3)].id}
    end
    it "returns 5 dishes from the database" do
      dishes_response = json_response
      expect(dishes_response[:dishes].length).to eq(5)
    end
    it {should respond_with 200}
  end
  
end
