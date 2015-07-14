FactoryGirl.define do
  factory :dish do
    name FFaker::Food.dish
    rating {rand(100...500) * 1.0 / 100}
    factory :dish_with_dish_type do
      transient do
        dish_type_count 1
      end
      after(:create) do |dish, evaluator|
        dish.dishes << create_list(:dish_type, evaluator.dishes_count)
        dish.save
        
        
      end
    end    
    
  end
end