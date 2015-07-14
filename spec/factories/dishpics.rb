FactoryGirl.define do
  factory :dishpic do
    url "dishpic.jpg"
    quality_score {rand(100...500) * 1.0 / 100}
    dish
  end
end