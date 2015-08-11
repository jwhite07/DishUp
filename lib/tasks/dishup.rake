namespace :dishup do
  desc "TODO"
  task reset_counters: :environment do
    Restaurant.all.each { |restaurant| Restaurant.reset_counters(restaurant.id, :dishes) }
    DishType.all.each { |dishtype| DishType.reset_counters(dishtype.id, :dishes) }
  end

end
