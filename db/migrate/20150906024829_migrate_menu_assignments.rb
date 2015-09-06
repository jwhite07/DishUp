class MigrateMenuAssignments < ActiveRecord::Migration
  def change
    MenuAssignment.all.each do |ma|
      if ma.menu && ma.menu_section 
        ma.menu.menu_sections << ma.menu_section
        ma.menu.save!
      end
      if ma.menu_section && ma.dish
        ma.menu_section.dishes << ma.dish
        ma.menu_section.save!
      end
      
      
    end
  end
end
