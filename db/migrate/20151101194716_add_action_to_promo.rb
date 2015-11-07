class AddActionToPromo < ActiveRecord::Migration
  def change
    add_column :promos, :action, :integer, default: 0, null: false
  end
end
