FactoryGirl.define do
  factory :location do
    name {FFaker::Company.name}
    address '123 Main'
    city 'New York'
    state 'NY'
    
    postal_code '48123'
    website {FFaker::Internet.http_url}
    phone_number {FFaker::PhoneNumber.phone_number}
    factory :location_with_restaurant do
      association :restaurant, factory: :restaurant_with_dishes, location_count: 0
    end
  end
end