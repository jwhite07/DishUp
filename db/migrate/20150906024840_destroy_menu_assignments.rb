class DestroyMenuAssignments < ActiveRecord::Migration
  def change
    drop_table "menu_assignments"
  end
end
