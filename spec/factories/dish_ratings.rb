FactoryGirl.define do
  factory :dish_rating, :class => 'DishRating' do
    user
    association :dish, factory: :standalone_dish
    rating {rand(1...5) }
  end
end
