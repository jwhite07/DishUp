class CreateDishpicIngredients < ActiveRecord::Migration
  def change
    create_table :dishpic_ingredients do |t|
      t.references :dishpic_id, index: true, foreign_key: true
      t.references :ingredient_id, index: true, foreign_key: true
    end
  end
end
