class AddDefaultToDishpicFavorites < ActiveRecord::Migration
  def change
    change_column :dishpics, :favorites, :integer, :default => 0
    
  end
end
