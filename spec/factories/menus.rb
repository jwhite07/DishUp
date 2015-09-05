FactoryGirl.define do
  factory :menu do
    name {FFaker::Company.name}
    factory :menu_with_restaurant do
      association :restaurant
      factory :menu_with_dishes do
        transient do
          dishes_count 5
        end
        after(:create) do |menu, evaluator|
          menu.dishes << create_list(:dish, evaluator.dishes_count, restaurant: menu.restaurant)
          menu.save
         end
      end
    end
  end
end