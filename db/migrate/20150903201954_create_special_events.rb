class CreateSpecialEvents < ActiveRecord::Migration
  def change
    create_table :special_events do |t|
      t.date :start_date
      t.date :end_date
      t.string :name
      t.boolean :launch_screen
      t.string :website

      t.timestamps null: false
    end
  end
end
