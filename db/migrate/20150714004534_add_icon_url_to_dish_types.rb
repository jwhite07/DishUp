class AddIconUrlToDishTypes < ActiveRecord::Migration
  def change
    add_column :dish_types, :icon_url, :string
  end
end
