FactoryGirl.define do
  factory :restaurant do
    name {FFaker::Company.name}
    address {FFaker::AddressUS.street_address}
    city {FFaker::AddressUS.city}
    state {FFaker::AddressUS.state}
    country {FFaker::AddressUS.country}
    postal_code {FFaker::AddressUS.zip_code}
    
    
    factory :restaurant_with_dishes do
      transient do
        dishes_count 5
      end
      after(:create) do |restaurant, evaluator|
        #create_list(:dish, evaluator.dishes_count, dish_type: dish_type)
        restaurant.dishes << create_list(:dish, evaluator.dishes_count)
        restaurant.save
      end
    end    
  end
end