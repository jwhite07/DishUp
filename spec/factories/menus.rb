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
          menu.menu_sections << create(:menu_section, restaurant: menu.restaurant)
          
          menu.save
         end
      end
    end
  end
end