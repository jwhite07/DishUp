class CreateDishesDishTypes < ActiveRecord::Migration
  def change
    create_table :dishes_dish_types do |t|
      t.references  :dish_id , index: true, foreign_key: true
      t.integer     :dish_type_id, index: true, foreign_key: true
    end
  end
end
