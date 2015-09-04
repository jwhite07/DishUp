FactoryGirl.define do
  factory :special_event do
    start_date {DateTime.now.to_date}
    end_date {1.days.from_now}
    name "Detroit Restaurant Week"
    launch_screen true
    factory :special_event_with_menus do
      transient do
        menus_count 4
      end
      after(:create) do |special_event, evaluator|
        
         create_list(:menu_with_dishes, evaluator.menus_count, special_event: special_event)
        special_event.save
      end
    end    
  end

end
