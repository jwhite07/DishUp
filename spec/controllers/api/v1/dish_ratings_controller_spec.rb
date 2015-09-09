require 'rails_helper'

RSpec.describe Api::V1::DishRatingsController, type: :controller do
  describe "POST #create" do
    before(:each) do
     
      @dish_rating_attributes = FactoryGirl.attributes_for :dish_rating
      @user = FactoryGirl.create :user
      @dish = FactoryGirl.create :dish_with_ratings
      api_authorization_header @user.auth_token
      
      post :create,  {dish_rating: @dish_rating_attributes, dish_id: @dish.id}
      
    end
    it "renders the json representation of the dish with new rating score" do
      dish_response = json_response[:dish][:dish_cached]
      puts "dish_response: #{dish_response}"
      expect(dish_response[:id]).to eql @dish[:id]
    end
    it {should respond_with 201}
  end
  describe "PATCH #update" do
    before(:each) do
      
      @dish_rating = FactoryGirl.create :dish_rating
      @user = @dish_rating.user
      @dish = @dish_rating.dish
      api_authorization_header @user.auth_token
      
      put :update,  {id: @dish_rating.id, 
                      dish_rating: {rating: rand(1...5), dish_id: @dish.id}}
      
    end
    it "renders the json representation of the dish with new rating score" do
      dish_response = json_response[:dish][:dish_cached]
      expect(dish_response[:id]).to eql @dish[:id]
    end
    it {should respond_with 200}
  end
end
