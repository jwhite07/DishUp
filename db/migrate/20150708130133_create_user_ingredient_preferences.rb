class CreateUserIngredientPreferences < ActiveRecord::Migration
  def change
    create_table :user_ingredient_preferences do |t|
      t.references :user_id, index: true, foreign_key: true
      t.references :ingredient_id, index: true, foreign_key: true
      t.boolean :like
      t.boolean :dislike

      t.timestamps null: false
    end
  end
end
