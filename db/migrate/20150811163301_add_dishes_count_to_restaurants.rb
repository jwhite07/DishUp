class AddDishesCountToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :dishes_count, :integer, default: 0
  end
end
