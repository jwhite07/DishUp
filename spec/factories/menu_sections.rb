FactoryGirl.define do
  factory :menu_section do
    restaurant 
    transient do
      dishes_count 5
    end
    after(:create) do |menu_section, evaluator|
      
      
      menu_section.dishes << create_list(:dish, evaluator.dishes_count, restaurant: menu_section.restaurant)
      menu_section.save
    end
    
  end

end
