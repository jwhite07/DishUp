require 'rails_helper'

RSpec.describe Api::V1::DishpicQualityRatingsController, type: :controller do

  describe "POST #create" do
    before(:each) do
      @dishpic_quality_rating_attributes = FactoryGirl.attributes_for :dishpic_quality_rating
      @user = FactoryGirl.create :user
      @dishpic = FactoryGirl.create :dishpic_with_ratings
      api_authorization_header @user.auth_token
      post :create,  {dishpic_quality_rating: @dishpic_quality_rating_attributes, dishpic_id: @dishpic.id}
      
    end
    it "renders the json representation of the dishpic with new rating score" do
      dishpic_response = json_response[:dishpic]
      expect(dishpic_response[:id]).to eql @dishpic[:id]
    end
    it {should respond_with 201}
  end
  describe "PATCH #update" do
    before(:each) do
      @dishpic_quality_rating = FactoryGirl.create :dishpic_quality_rating
      @user = @dishpic_quality_rating.user
      @dishpic = @dishpic_quality_rating.dishpic
      api_authorization_header @user.auth_token
      
      put :update,  {id: @dishpic_quality_rating.id, 
                      dishpic_quality_rating: {rating: rand(1...5), dishpic_id: @dishpic.id}}
      
    end
    it "renders the json representation of the dish with new rating score" do
      dishpic_response = json_response[:dishpic]
      expect(dishpic_response[:id]).to eql @dishpic[:id]
    end
    it {should respond_with 200}
  end
end
