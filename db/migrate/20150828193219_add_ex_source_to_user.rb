class AddExSourceToUser < ActiveRecord::Migration
  def change
    add_column :users, :ex_source, :string
  end
end
