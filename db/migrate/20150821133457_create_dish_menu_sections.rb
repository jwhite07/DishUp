class CreateDishMenuSections < ActiveRecord::Migration
  def change
    create_table :dish_menu_sections do |t|
      t.references :dish, index: true, foreign_key: true
      t.references :menu_section, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
