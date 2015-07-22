class AddPhoneNumberWebsiteHoursToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :phone_number, :string
    add_column :restaurants, :website, :string
    add_column :restaurants, :hours, :string
  end
end
