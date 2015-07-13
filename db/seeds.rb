# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities                          = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#include 'ffaker'
AdminUser.create!(email: 'jwhite@eliteworx.com', password: 'password', password_confirmation: 'password') 

restaurants         = [
  {
    "name"          => "Slows BBQ", 
    "address"       => "2138 Michigan Avenue", 
    "city"          => "Detroit", 
    "state"         => "MI", 
    "country"       => "USA", 
    "postal_code"   => "48216", 
    "logo"          => "http://slowsbarbq.com/sites/slowsbarbq.com/files/logo.png",
    "premium_level" => "partner"
  },
  {
    "name"          => "Green Dot Stables", 
    "address"       => "2200 W Lafayette Blvd", 
    "city"          => "Detroit", 
    "state"         => "MI", 
    "country"       => "USA", 
    "postal_code"   => "48216", 
    "logo"          => "http://greendotstables.com/wp-content/uploads/2011/09/logo-greendot1.png",
    "premium_level" => "member"
  },
  {
    "name"          => "Crispellis Bakery & Pizza", 
    "address"       => "6690 Orchard Lake Rd", 
    "city"          => "West Bloomfield Township", 
    "state"         => "MI", 
    "country"       => "USA", 
    "postal_code"   => "48322", 
    "logo"          => "http://crispellis.com/wp-content/uploads/2014/08/LOGO_200x61.png",
    "premium_level" => "listed"
  }
]

restaurants.each do |restaurant|
  #puts restaurant
  r = Restaurant.create!(restaurant)
  puts r
end

Restaurant.all.each do |rest|
  Menu.create! ({:name              => rest.name, :restaurant_id => rest.id})
end

slows_dishes  = [
  {
    "name"        => "BBQ Wings", 
    "price"       => 9.95, 
    "description" => "A stack of our famous wings, marinated, rubbed and smoked until awesome.", 
    "dish_types"  => [
      "Appetizers & Sides"
    ], 
    "ingredients" => [
      "Chicken"
    ]
  },
  {
    "name"        => "SLOWS CHILI CHEESE FRIES", 
    "price"       => 7.95, 
    "description" => "Our classic waffle fries smothered in Hoffman’s Super Sharp Cheddar and our chili ", 
    "dish_types"  => [
      "Appetizers & Sides"
    ],    
    "ingredients" => [
      "Waffle Fries",
      "Chili",
      "Cheese"
    ]
  },
  {
    "name"        => "BRISKET ENCHILADA", 
    "price"       => 6.95, 
    "description" => "Smoked beef brisket, sautéed onion, and smoky gouda filled corn tortillas, topped with cheddar, spicy sauce, and scallions.", 
    "dish_types"  => [
      "Appetizers & Sides"
    ]
  },
  {
    "name"        => "The Reason",
    "price"       => 8.49, 
    "description" => "Pork butt, smoked slow and pulled, bathed in sauce and topped with our signature coleslaw and dill pickle strips.", 
    "dish_types"  => [
      "BBQ",
      "Sandwiches"
    ],    
    "ingredients" => [
      "Pork",
      "Coleslaw",
      "Dill Pickle Strips"
    ]
  },
  {
    "name"        => "The Longhorn", 
    "price"       => 9.99, 
    "description" => "Beef brisket sliced thin with our special onion marmalade, smoked gouda and spicy sauce.", 
    "dish_types"  => [
      "BBQ",
      "Sandwiches"
    ],    
    "ingredients" => [
      "Beef Brisket",
      "Smoked Gouda"
    ]
  },
  {
    "name"        => "The Yardbird", 
    "price"       => 9.99, 
    "description" => "Smoked chicken, pulled apart and tossed in Yardbird sauce with sautéed mushrooms and cheddar cheese, and topped with applewood bacon.", 
    "dish_types"  => [
      "BBQ",
      "Sandwich"
    ],    
    "ingredients" => [
      "Smoked Chicken",
      "Sauteed Mushrooms",
      "Cheddar Cheese"
    ]
  },
  {
    "name"        => "House Salad", 
    "price"       => 4.95,
    "description" => "Red leaf tossed with sweet red pepper, red onion, cucumber, green olive, carrots, croutons.",
    "dish_types"  => [
      "Salad"
    ],    
    "ingredients" => [
      "Red Leaf Lettuce",
      "Red Onion",
      "Cucumber",
      "Green Olive",
      "Carrot",
      "Crouton"
    ]
  },
  {
    "name"        => "Slows Caesar",
    "price"       => 4.95,
    "description" => "Crisp romaine lettuce, asiago cheese, croutons and Chef's secret recipe dressing.",
    "dish_types"  => [
      "Salad"
    ],    
    "ingredients" => [
      "Romaine Lettuce",
      "Asiago Cheese",
      "Crouton"
    ]
  },
  {
    "name"        => "Charles Bronson",
    "price"       => 4.95,
    "description" => "Baby spinach, roasted red onion, smoked gouda and applewood bacon tossed with our Pit Smoked Tomato Vinaigrette",
    "dish_types"  => [
      "Salad"
    ],    
    "ingredients" => [
      "Baby Spinach",
      "Roasted Red Onion",
      "Smoked Gouda",
      "Bacon",
      "Tomato Vinaigrette"
    ]
  }
]

greendot_dishes   = [
  
  {
    "name"        => "Quinoa Burger Slider",
    "price"       => 3.00,
    "description" => "Kale-Chimichurri",
    "dish_types"  => [
      "Vegetarian",
      "Burgers",
      "Sliders"
    ],    
    "ingredients" => [
      "Kale",
      "Chimichurri",
      "Quinoa"
    ]
  },
  {
    "name"        => "Corned Beef Slider",
    "price"       => 3.00,
    "description" => "Wigley’s-Kraut-Pickles-Mustard Aioli",
    "dish_types"  => [
      "Sliders",
      "Sandwiches"
    ],    
    "ingredients" => [
      "Corned Beef",
      "Sour Kraut",
      "Pickles",
      "Mustard Aioli"
    ]
  },
  {
    "name"        => "Cuban Slider",
    "price"       => 3.00,
    "description" => "Pork Loin-Ham-Jack Cheese-Mustard-Pickles",
    "dish_types"  => [
      "Sliders",
      "Sandwiches"
    ],    
    "ingredients" => [
      "Pork Loin",
      "Ham",
      "Jack Cheese",
      "Mustard",
      "Pickles"
    ]
  },
  {
    "name"        => "BBQ Bacon Slider",
    "price"       => 3.00,
    "description" => "Beef Patty-Sweet Potato-Housemade BBQ Sauce",
    "dish_types"  => [
      "BBQ",
      "Sandwiches",
      "Burgers"
    ],    
    "ingredients" => [
      "Beef Patty",
      "Sweet Potato",
      "BBQ Sauce"
    ]
  },
  {
    "name"        => "Chicken Tortilla Soup",
    "price"       => 3.00,
    "description" => "Chicken-Fresno Pepper-Cilantro-Tortilla Chips",
    "dish_types"  => [
      "Soups",
      "Chicken",
      "Appetizers & Sides"
    ],    
    "ingredients" => [
      "Chicken",
      "Fresno Pepper",
      "Cilantro",
      "Tortilla Chips"
    ]
  },
  {
    "name"        => "Iceburg Wedge Salad",
    "price"       => 3.00,
    "description" => "Tomato-Red Onion-Bacon Lardon-Thousand Island-Blue Cheese",
    "dish_types"  => [
      "Salad"
    ],    
    "ingredients" => [
      "Tomato",
      "Red Onion",
      "Bacon",
      "Thousand Island Dressing",
      "Blue Cheese"
    ]
  },
  {
    "name"        => "Corktown Smore",
    "price"       => 3.00,
    "description" => "Cinnamon-Nutella-Fluff",
    "dish_types"  => [
      "Desserts"
    ],    
    "ingredients" => [
      "Cinnamon",
      "Nutella",
      "Marshmallow Fluff"
    ]
  },
  {
    "name"        => "Mac & Cheese",
    "price"       => 3.00,
    "description" => "Parmesan-Mornay",
    "dish_types"  => [
      "Appetizers & Sides",
      "Pasta"
    ],    
    "ingredients" => [
      "Parmesan",
      "Mornay"
    ]
  },
  {
    "name"        => "Truffle & Herb French Fries",
    "price"       => 3.00,
    "dish_types"  => [
      "Appetizers & Sides"
    ]   
    
    
  },
  {
    "name"        => "Kale Salad",
    "price"       => 3.00,
    "description" => "Quinoa-Lemon-Shallot",
    "dish_types"  => [
      "Salads",
      "Vegetarian"
    ],    
    "ingredients" => [
      "Kale",
      "Quinoa",
      "Lemon",
      "Shallot"
    ]
  },
  {
    "name"        => "Mushroom Broth Soup",
    "price"       => 3.00,
    "description" => "Button & Oyster Mushrooms-Parsley",
    "dish_types"  => [
      "Soups",
      "Vegetarian"
    ],    
    "ingredients" => [
      "Button Mushrooms",
      "Oyster Mushrooms",
      "Parsley"
    ]
  }
]  
crispellis_dishes = [
  {
    "name"        => "Crispelli Salad",
    "price"       => 5.25,
    "description" => "house blend lettuce, garbanzo beans, cucumber, carrot, tomato, olive, parmesan cheese, red wine vinaigrette, and crostini",
    "dish_types"  => [
      "Salads",
      "Vegetarian"
    ],    
    "ingredients" => [
      "Lettuce",
      "Garbanzo Bean",
      "Cucumber",
      "Carrot",
      "Tomato",
      "Olive",
      "Parmesan Cheese",
      "Red Wine Vinaigrette",
      "Crostini"
      
    ]
  },
  {
    "name"        => "Caesar Salad",
    "price"       => 5.25,
    "description" => "romaine lettuce, parmesan & crostini with classic dressing",
    "dish_types"  => [
      "Salads",
      "Vegetarian"
    ],    
    "ingredients" => [
      "Romaine Lettuce",
      "Parmesan",
      "Crostini",
      "Caesar Dressing"
    ]
  },
  {
    "name"        => "Mediterranean Salad",
    "price"       => 5.25,
    "description" => "house blend lettuce, kalamata olives, beets, tomato, marinated red onion, cucumber and feta, with lemon oregano dressing",
    "dish_types"  => [
      "Salads",
      "Vegetarian"
    ],    
    "ingredients" => [
      "Lettuce",
      "Kalamata Olive",
      "Beet",
      "Tomato",
      "Marinated Red Onion",
      "Cucumber",
      "Feta Cheese",
      "Lemon Oregano Dressing"
    ]
  },
  {
    "name"        => "Michigan Salad",
    "price"       => 9.50,
    "description" => "house blend luttuce, dried cherries & cranberries, poached apples & pears, bleu cheese, candied walnuts, bacon with sherry vinaigrette",
    "dish_types"  => [
      "Salads"
    ],    
    "ingredients" => [
      "Lettuce",
      "Dried Cherries",
      "Dried Cranberries",
      "Poached Apples",
      "Poached Pears",
      "Bleu Cheese",
      "Candied Walnuts",
      "Bacon",
      "Sherry Vinaigrette"
    ]
  },
  {
    "name"        => "Authentic Italian Thin Crust Pizza",
    "price"       => 7.95,
    "description" => "tomato sauce and mozzarella",
    "dish_types"  => [
      "Pizza"
    ],    
    "ingredients" => [
      "Tomato Sauce",
      "Mozzarella Cheese"
    ]
  },
  {
    "name"        => "Deep Dish Pizza(Detroit Style)",
    "price"       => 14.25,
    "description" => "tomato sauce and mozzarella",
    "dish_types"  => [
      "Pizza"
    ],    
    "ingredients" => [
      "Tomato Sauce",
      "Mozzarella Cheese"
    ]
  },
  {
    "name"        => "Margherita Pizza",
    "price"       => 8.95,
    "description" => "tomato sauce, roma tomato, fresh mozzarella, basil & extra virgin olive oil",
    "dish_types"  => [
      "Pizza"
    ],    
    "ingredients" => [
      "Parmesan",
      "Mornay"
    ]
  },
  {
    "name"        => "Red Pie Pizza",
    "price"       => 8.95,
    "description" => "tomato sauce, fresh mozzarella, italian sausage, caramelized onion",
    "dish_types"  => [
      "Pizza"
    ],    
    "ingredients" => [
      "Tomato Sauce",
      "Fresh Mozzarella",
      "Italian Sausage",
      "Caramelized Onion"
    ]
  },
  {
    "name"        => "Cheeseburger",
    "price"       => 8.95,
    "description" => "1/2lb choice beef, with cheddar or swiss cheese",
    "dish_types"  => [
      "Burgers"
    ],    
    "ingredients" => [
      "Beef Burger",
      "Cheddar Cheese",
      "Swiss Cheese"
    ]
  },
  {
    "name"        => "Mushroom & Truffle Mayo Burger",
    "price"       => 9.95,
    "description" => "1/2 lb choice beef, mushrooms, truffle mayonnaise, swiss cheese",
    "dish_types"  => [
      "Burgers"
    ],    
    "ingredients" => [
      "Beef Burger",
      "Mushrooms",
      "Truffle Mayonnaise",
      "Swiss Cheese"
    ]
  },
  {
    "name"        => "Bacon & Bleu Cheese Burger",
    "price"       => 10.50,
    "description" => "1/2 lb choice beef, crumbled bleu cheese, bacon, bleu cheese horseradish spread",
    "dish_types"  => [
      "Burgers"
    ],    
    "ingredients" => [
      "Beef Burger",
      "Bleu Cheese",
      "Bacon",
      "Bleu Cheese Horseradish Spread"
    ]
  }
  
] 


dishes = slows_dishes + greendot_dishes + crispellis_dishes

dishes.each do |dish|
  dish["rating"] = rand(100...500) * 1.0 / 100
  dishatts  = [ "name", "price", "description", "rating" ]
  d = dish.slice(*dishatts)
  new_dish = Dish.create!(d)
  #Create or find DishType and association to this dish
  if dish["dish_types"]
    dish["dish_types"].each do |dt|
      dish_type = DishType.where(:name => dt).first_or_create
      DishesDishType.create!(:dish_id => new_dish.id, :dish_type_id => dish_type.id)
    end
  end
  
  #Create or find Ingredients and associations to this dish
  if dish["ingredients"]  
    dish["ingredients"].each do |ing|
      ingredient = Ingredient.where(:name => ing).first_or_create
      DishesIngredient.create!(:dish_id => new_dish.id, :ingredient_id => ingredient.id)
    end
  end
end


50.times do
  User.create! ({
    "name"                          => FFaker::Name.name,
    "email"                         => FFaker::Internet.email,
    "password"                      => "12345678",
    "password_confirmation"         => "12345678"
  })
end
users = User.all.to_a

dishpics = []
i = 0
Dish.all.each do |dish|
  6.times do |j|
    dishpics[i]                     = {
      :dish_id                      => dish.id,
      :favorites                    => 1 + rand(10000),
      :flagged                      => false,
      :remove                       => false,
      :quality_score                => rand(1...5),
      :url                          => "#{dish.name.underscore}_#{j}.jpg",
      :user_id                      => users[rand(users.length)].id
    }
    i += 1
  end
end
dishpics.each do |dishpic|
  Dishpic.create!(dishpic)
end






