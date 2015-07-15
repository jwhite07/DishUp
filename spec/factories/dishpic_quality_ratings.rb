FactoryGirl.define do
  factory :dishpic_quality_rating, :class => 'DishpicQualityRatings' do
    
        user
        dishpic
        rating {rand(1...5) }
     
    
  end

end
