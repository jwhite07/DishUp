class AddDishesCountToDishTypes < ActiveRecord::Migration
  def change
    add_column :dish_types, :dishes_count, :integer, default: 0
  end
end
