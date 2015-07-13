class RenameDishpicIngredients < ActiveRecord::Migration
  def change
    rename_table :dishpic_ingredients, :dishpics_ingredients
  end
end
