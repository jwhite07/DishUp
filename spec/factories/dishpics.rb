FactoryGirl.define do
  factory :dishpic do
    url "dishpic.jpg"
    quality_score {rand(100...500) * 1.0 / 100}
    association :dish, factory: :standalone_dish
    
    factory :dishpic_with_ratings do
      transient do
        rating_count 5
      end
      after(:create) do |dishpic, evaluator|
        create_list(:dishpic_quality_rating, evaluator.rating_count, dishpic: dishpic)
      end 
    end
  end
end