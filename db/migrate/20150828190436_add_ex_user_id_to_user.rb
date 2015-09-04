class AddExUserIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :ex_user_id, :string
  end
end
