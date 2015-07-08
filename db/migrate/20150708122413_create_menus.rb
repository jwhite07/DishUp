class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.references :restaurant_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
