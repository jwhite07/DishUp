class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.references :user, index: true, foreign_key: true
      t.references :dish, index: true, foreign_key: true
      t.references :dishpic, index: true, foreign_key: true
      t.boolean :flag
      t.string :type

      t.timestamps null: false
    end
  end
end
