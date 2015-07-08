class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.decimal :price
      t.references :menu_id
      t.decimal :rating
      t.text :description

      t.timestamps null: false
    end
  end
end
