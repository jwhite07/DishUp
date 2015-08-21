class MoveDishAssocFromMenuToMenuSection < ActiveRecord::Migration
  def change
    Menu.all.each do |m|
      MenuSection.create do |ms|
        ms.name = "All dishes"
        ms.menus << m
        ms.restaurant_id = m.restaurant_id
        m.dishes.each do |d|
          ms.dishes << d
        end
        ms.save!
      end
    end
  end
end
