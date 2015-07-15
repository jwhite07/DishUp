FactoryGirl.define do
  factory :dish_rating, :class => 'DishRating' do
    user
    dish
    rating {rand(1...5) }
  end
end
