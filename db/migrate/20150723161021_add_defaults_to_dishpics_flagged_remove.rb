class AddDefaultsToDishpicsFlaggedRemove < ActiveRecord::Migration
  def change
    change_column :dishpics, :flagged, :boolean, default: false
    change_column :dishpics, :remove, :boolean, default: false
  end
end
