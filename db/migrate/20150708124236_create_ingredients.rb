class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.boolean :allergen
      t.boolean :optional

      t.timestamps null: false
    end
  end
end
