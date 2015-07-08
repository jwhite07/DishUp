class CreateDishIngredients < ActiveRecord::Migration
  def change
    create_table :dish_ingredients do |t|
      t.references :dish_id, index: true, foreign_key: true
      t.references :ingredient_id, index: true, foreign_key: true
    end
  end
end
