class Cleanup < ActiveRecord::Migration
  def change
    #This migration is just to update the dev db, changes for production were retroactively added to the previous three migrations
    # add_column :locations, :latitude, :float
#     add_column :locations, :longitude, :float
#
#     Location.all.each do |loc|
#
#       loc.latitude       = loc.restaurant.latitude
#       loc.longitude      = loc.restaurant.longitude
#
#       loc.save!
#     end
#     remove_column :restaurants, :latitude
#     remove_column :restaurants, :longitude
#
#     add_index :locations, :longitude
#     add_index :locations, :latitude
  end
end
