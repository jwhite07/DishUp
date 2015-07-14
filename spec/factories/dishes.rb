FactoryGirl.define do
  factory :dish do
    name "BBQ Burger"
    rating rand(100...500) * 1.0 / 100
    association :dish_type, name: "Burgers"
    
  end
end