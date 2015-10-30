class AddAssociationsToPromos < ActiveRecord::Migration
  def change
    add_reference :promos, :restaurant, index: true, foreign_key: true
    add_reference :promos, :special_event, index: true, foreign_key: true
  end
end
