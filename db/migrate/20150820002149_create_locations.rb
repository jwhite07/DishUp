class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :postal_code
      t.references :restaurant, index: true, foreign_key: true
      t.string :logo
      t.string :website
      t.string :phone_number
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
      
    end
    add_index :locations, :longitude
    add_index :locations, :latitude
  end
end
