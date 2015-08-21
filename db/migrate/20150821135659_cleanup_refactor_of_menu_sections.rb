class CleanupRefactorOfMenuSections < ActiveRecord::Migration
  def change
   
    drop_table :dishes_menus
  end
end
