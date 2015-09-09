class AddSpecialEventToDishType < ActiveRecord::Migration
  def change
    add_reference :dish_types, :special_event, index: true, foreign_key: true
  end
end
