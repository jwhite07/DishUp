class AddDisplayNameToMenuSections < ActiveRecord::Migration
  def change
    add_column :menu_sections, :display_name, :string
  end
end
