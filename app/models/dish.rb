class Dish < ActiveRecord::Base
  default_scope {order("rating DESC")}
  after_save :add_to_default_menu
  belongs_to :restaurant, :counter_cache => :dishes_count
  
  has_many :dishes_dish_types
  has_many :dish_types, :through => :dishes_dish_types
  accepts_nested_attributes_for :dish_types
  
  has_many :dish_menu_sections
  has_many :menu_sections, -> {uniq}, :through => :dish_menu_sections
  has_many :menu_menu_sections, :through => :menu_sections
  has_many :menus, -> {uniq}, :through => :menu_menu_sections
  
  
  has_many :dishes_ingredients
  has_many :ingredients, :through => :dishes_ingredients
  
  has_many :dishpics
  accepts_nested_attributes_for :dishpics
  
  has_many :dish_ratings
  
  validates :name,  :rating, :restaurant_id, presence: true
  validates :rating, numericality: {
    greater_than_or_equal_to: 0, 
    less_than_or_equal_to: 5
  }
  
  
  def lead_dishpic_url
    if dishpics.count > 0
      dishpics.first.url
    else
      nil
    end
  end
  
  
  def add_to_default_menu
    default_menu = Menu.where(restaurant_id: self.restaurant.id).first_or_create!
    default_section = MenuSection.where(restaurant_id: self.restaurant.id ).first_or_create!
    default_menu.menu_sections << default_section if default_menu.menu_sections.count == 0
    
    
    default_section.dishes << self
  end
  def self.import_from_json(filename, user_id)
    file = File.read(File.join(Rails.root, filename))
    dishes = JSON.parse(file)
    no_restaurant = []
    dishpicNames = []
    dishes.each do |d|
      puts d
      
      if rest = Restaurant.where(name: d["restaurant"]).first
        Dish.new do |n|
          n.name = d["name"]
          n.description = d["menu description"]
          p = d["price"].delete("$")
          
          if /([^0-9\. ])+/.match(p) == nil
            n.price = p 
          else
            n.description = "#{d['price']} #{n.description}"
          end
          n.restaurant_id = rest.id
          
          if d["gluten free"] == "yes"
            gfMenu = Menu.where(restaurant_id: rest.id, name: "#{rest.name} - Gluten Free Menu").first_or_create do |gf|
              gf.name = "#{rest.name} - Gluten Free Menu"
              gf.restaurant_id = rest.id
              gf.default = false
              gf.save!
            end
            n.menus << gfMenu         
          end
          n.save!
          Dishpic.new do |dp|
            dp.user_id = user_id
            dp.dish_id = n.id
            dpurl_base = "https://d2l61v32h6u0qg.cloudfront.net/dishpics/"
            dpfilename = "#{rest.name.parameterize.underscore.camelize}_#{n.name.parameterize.underscore.camelize}.jpg"
            dp.url     = dpurl_base + dpfilename
            dp.save!
            dishpicNames << dpfilename
            
          end
        end
        
      else
        no_restaurant << d
      end
    end
    File.open(File.join(Rails.root, "dishpics.txt"), 'w') do |f|
      f.puts(dishpicNames)
    end
    puts no_restaurant
  end
end
