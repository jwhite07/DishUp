class AddDefaultToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :default, :boolean, default: false
    
  end
end
