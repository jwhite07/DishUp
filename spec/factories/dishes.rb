FactoryGirl.define do
  factory :dish do
    name FFaker::Food.dish
    rating {rand(100...500) * 1.0 / 100}
    restaurant
    factory :dish_with_dish_type do
      transient do
        dish_type_count 1
      end
      after(:create) do |dish, evaluator|
        dish.dishes << create_list(:dish_type, evaluator.dish_type_count)
        dish.save
      end
    end   
    factory :dish_with_dishpics do
      transient do
        dishpic_count 5
      end
      after(:create) do |dish, evaluator|
        create_list(:dishpic, evaluator.dishpic_count, dish: dish)
        
      end
    end 
    factory :dish_with_ratings do
      transient do
        rating_count 5
      end
      after(:create) do |dish, evaluator|
        create_list(:dish_rating, evaluator.rating_count, dish: dish)
      end 
    end
  end
end