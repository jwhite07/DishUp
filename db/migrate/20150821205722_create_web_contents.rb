class CreateWebContents < ActiveRecord::Migration
  def change
    create_table :web_contents do |t|
      t.string :identifier
      t.text :contents
      t.string :html_class
      t.string :html_id
      
      t.timestamps null: false
    end
  end
end
