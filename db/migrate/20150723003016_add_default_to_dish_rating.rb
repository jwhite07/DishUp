class AddDefaultToDishRating < ActiveRecord::Migration
  def change
    change_column :dishes, :rating, :decimal, :default => 0.0
  end
end
