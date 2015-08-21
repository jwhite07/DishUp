class AddSortOrderToDishType < ActiveRecord::Migration
  def change
    add_column :dish_types, :sort_order, :integer, default: 0
  end
end
