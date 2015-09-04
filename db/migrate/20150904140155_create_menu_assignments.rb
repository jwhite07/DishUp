class CreateMenuAssignments < ActiveRecord::Migration
  def change
    create_table :menu_assignments do |t|
      t.references :menu, index: true, foreign_key: true
      t.references :menu_section, index: true, foreign_key: true
      t.references :dish, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
