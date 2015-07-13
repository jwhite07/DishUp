class CreateDishesMenus < ActiveRecord::Migration
  def change
    create_table :dishes_menus do |t|
      t.references :dish, index: true, foreign_key: true
      t.references :menu, index: true, foreign_key: true
    end
  end
end
