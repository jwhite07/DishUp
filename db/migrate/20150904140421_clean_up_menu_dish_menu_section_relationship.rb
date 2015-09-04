class CleanUpMenuDishMenuSectionRelationship < ActiveRecord::Migration
  def change
    drop_table :menu_menu_sections
    drop_table :dish_menu_sections
  end
end
