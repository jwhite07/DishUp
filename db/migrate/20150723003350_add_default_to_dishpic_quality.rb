class AddDefaultToDishpicQuality < ActiveRecord::Migration
  def change
    change_column :dishpics, :quality_score, :decimal, :default => 0.0
  end
end
