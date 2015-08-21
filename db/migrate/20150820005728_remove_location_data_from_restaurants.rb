class RemoveLocationDataFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :address
    remove_column :restaurants, :city
    remove_column :restaurants, :state
    remove_column :restaurants, :country
    remove_column :restaurants, :postal_code
    remove_column :restaurants, :logo
    remove_column :restaurants, :website
    remove_column :restaurants, :phone_number
    remove_column :restaurants, :latitude
    remove_column :restaurants, :longitude
    
  end
end
