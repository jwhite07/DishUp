class Promo < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :special_event
  scope :only_active, -> {where("start_date < ? AND end_date > ? ", DateTime.now, DateTime.now)}
  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  
  def full_address
    "#{address}  #{city}  #{state}"
  end
  
end
