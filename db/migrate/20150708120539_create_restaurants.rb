class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :postal_code
      t.string :logo
      t.string :premium_level

      t.timestamps null: false
    end
  end
end
