class CreateMenuSections < ActiveRecord::Migration
  def change
    create_table :menu_sections do |t|
      t.references :restaurant, index: true, foreign_key: true
      t.string :name
      t.string :description
      t.integer :sort_order

      t.timestamps null: false
    end
  end
end
