class AddUrlToDishpic < ActiveRecord::Migration
  def change
    add_column :dishpics, :url, :string
  end
end
