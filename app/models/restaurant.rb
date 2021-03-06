class Restaurant < ActiveRecord::Base
  scope :only_with_dishes, -> {where("dishes_count > ? ", 0)}
  
  after_save :add_default_menu
  has_many :menus
  accepts_nested_attributes_for :menus
  has_many :menu_sections
  accepts_nested_attributes_for :menu_sections
  
  validates_associated :menus
  has_many :dishes
  has_many :locations
  accepts_nested_attributes_for :locations

  has_many :special_events, :through => :menus
  
  validates :name,  presence: true
  
  def add_default_menu
    Menu.where(restaurant_id: self.id).first_or_create do |menu|
      menu.name = self.name
      menu.restaurant_id = self.id
      menu.default = true
      menu.save!
    end
  end
  def default_menu
    Menu.where(restaurant_id: self.id, default: true).first
  end
  # def self.import_from_json_file(filename)
#     file = File.read(File.join(Rails.root, filename))
#     restaurants = JSON.parse(file)
#     restaurants.each do |r|
#       puts r
#       Restaurant.where(name:  r["name"]).first_or_create do |n|
#         n.address = r["address"]
#         n.city = r["city"]
#         n.country = r["country"]
#         n.hours = r["hours"]
#         n.logo = r["logo"]
#         n.name = r["name"]
#         n.phone_number = r["phone_number"]
#         n.postal_code = r["postal_code"]
#         n.state = "MI"
#         n.website = r["website"]
#         n.save!
#       end
#     end
#   end
end
