class AddRestaurantToDishes < ActiveRecord::Migration
  def change
    add_reference :dishes, :restaurant, index: true, foreign_key: true
  end
end
