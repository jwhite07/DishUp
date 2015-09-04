class AddExTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :ex_token, :string
  end
end
