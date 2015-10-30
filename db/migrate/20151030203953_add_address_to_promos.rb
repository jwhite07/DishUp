class AddAddressToPromos < ActiveRecord::Migration
  def change
    add_column :promos, :address, :string
    add_column :promos, :city, :string
    add_column :promos, :state, :string
  end
end
