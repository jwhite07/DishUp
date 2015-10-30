class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.string :name
      t.integer :priority
      t.date :start_date
      t.date :end_date
      t.string :img
      t.text :message
      t.string :color
      t.float :longitude
      t.float :latitude
      t.integer :radius

      t.timestamps null: false
    end
  end
end
