class AddSpecialEventToMenu < ActiveRecord::Migration
  def change
    add_reference :menus, :special_event, index: true, foreign_key: true
  end
end
