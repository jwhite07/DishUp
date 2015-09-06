FactoryGirl.define do
  factory :restaurant do
    name {FFaker::Company.name}
    transient do
      location_count 1
    end
    after(:create)  do |r, e|
        r.locations << create_list(:location, e.location_count)
        r.save
    end
    
    factory :restaurant_with_dishes do
      transient do
        dishes_count 5
      end
      after(:create) do |restaurant, evaluator|
        #create_list(:dish, evaluator.dishes_count, dish_type: dish_type)
        restaurant.dishes << create_list(:dish, evaluator.dishes_count, restaurant: restaurant)
        restaurant.save
      end
    end 
    factory :restaurant_with_special_event_menu do
      transient do
        dishes_count 5
      end
      after(:create) do |restaurant, evaluator|
        restaurant.dishes << create_list(:dish, evaluator.dishes_count, restaurant: restaurant)
        restaurant.save
        
        menu = create(:menu)
        menu.dishes << restaurant.dishes
        menu.save
        
      end
    end       
  end
end