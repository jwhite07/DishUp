class RenameDishIngredients < ActiveRecord::Migration
  def change
    rename_table :dish_ingredients, :dishes_ingredients
  end
end
