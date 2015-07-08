class CreateDishpics < ActiveRecord::Migration
  def change
    create_table :dishpics do |t|
      t.references :dish_id
      t.integer :favorites
      t.references :user_id
      t.boolean :flagged
      t.boolean :remove
      t.text :caption
      t.decimal :quality_score

      t.timestamps null: false
    end
  end
end
