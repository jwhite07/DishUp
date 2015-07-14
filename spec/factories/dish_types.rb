FactoryGirl.define do
  factory :dish_type do
    name {FFaker::Food.dish_type}
    
    factory :dish_type_with_dishes do
      transient do
        dishes_count 5
      end
      after(:create) do |dish_type, evaluator|
        #create_list(:dish, evaluator.dishes_count, dish_type: dish_type)
        dish_type.dishes << create_list(:dish, evaluator.dishes_count)
        dish_type.save
      end
    end    
  end
end