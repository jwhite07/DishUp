class Location < ActiveRecord::Base
  scope :only_with_dishes, -> {Location.joins(:restaurant).where("restaurants.dishes_count > ? ", 0)}
  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  belongs_to :restaurant
  validates :name, :address, :city, :state, presence: true
  def full_address
    address + city + state + postal_code
  end
end
