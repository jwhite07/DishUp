class MoveRestaurantDataToLocation < ActiveRecord::Migration
  def change
      Restaurant.all.each do |r|
        Location.create do |loc|
        loc.name           = r.name
        loc.address        = r.address
        loc.city           = r.city
        loc.state          = r.state
        loc.country        = r.country
        loc.postal_code    = r.postal_code
        loc.logo           = r.logo
        loc.phone_number   = r.phone_number
        loc.website        = r.website
        loc.restaurant_id  = r.id
        loc.latitude       = r.latitude
        loc.longitude      = r.longitude
        
        loc.save!
      end
    end
  end
end
