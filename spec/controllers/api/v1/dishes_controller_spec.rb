require 'spec_helper'

RSpec.describe Api::V1::DishesController, type: :controller do
  describe "dish_types/n/dishes GET #index" do
    before(:each) do
      dish_types = []
      4.times do 
        dish_types << FactoryGirl.create(:dish_type_with_dishes)
      end
      get :index, {:dish_type_id => dish_types[rand(0...3)].id}
    end
    it "returns 5 dishes from the database" do
      dishes_response = json_response
      expect(dishes_response[:dish_previews].length).to eq(5)
    end
    it {should respond_with 200}
  end
  describe "restaurants/n/dishes GET #index" do
    before(:each) do
      restaurants = []
      4.times do 
        restaurants << FactoryGirl.create(:restaurant_with_dishes)
      end
      get :index, {:restaurant_id => restaurants[rand(0...3)].id}
    end
    it "returns 5 dishes from the database" do
      dishes_response = json_response
      
      expect(dishes_response[:dish_previews].length).to eq(5)
    end
    it {should respond_with 200}
  end
  describe "menus/n/dishes GET #index" do
    before(:each) do
      menus = []
      4.times do 
        menus << FactoryGirl.create(:menu_with_dishes)
      end
      get :index, {:menu_id => menus[rand(0...3)].id}
    end
    it "returns 5 dishes from the database" do
      dishes_response = json_response
      
      expect(dishes_response[:dish_previews].length).to eq(5)
    end
    it {should respond_with 200}
  end
  describe "dishes GET #index" do
    before(:each) do
      dishes = []
      4.times do 
        dishes << FactoryGirl.create(:standalone_dish)
      end
      get :index
    end
    it "returns 4 dishes from the database" do
      dishes_response = json_response
      expect(dishes_response[:dish_previews].length).to eq(4)
    end
    it {should respond_with 200}
  end
  describe "dishes GET #show" do
     
    before(:each) do
      dishes = []
      4.times do 
        dishes << FactoryGirl.create(:dish_with_dishpics)
      end
      @dish = dishes[rand(0...3)]
      get :show, {:id => @dish.id}
    end
    it "returns a dish from the database" do
      dishes_response = json_response
      
      expect(dishes_response[:dish][:dish_non_cached][:id]).to eq(@dish.id)
    end
    it "includes location details" do
      dishes_response = json_response
      
      expect(dishes_response[:dish][:dish_non_cached][:location][:id]).to eq(@dish.restaurant.locations.first.id)
    end
    it "includes 5 dishpics" do
      dishes_response = json_response
      expect(dishes_response[:dish][:dish_non_cached][:dishpics].length).to eq(5)
    end
    
    it {should respond_with 200}
  end
end
