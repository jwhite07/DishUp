class ChangeColorsInPromos < ActiveRecord::Migration
  def change
    rename_column :promos, :color, :title_color
    add_column :promos, :body_color, :string
  end
end
