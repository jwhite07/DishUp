class AddUrlToPromos < ActiveRecord::Migration
  def change
    add_column :promos, :url, :string
  end
end
