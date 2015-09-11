class AddDisabledToWebContents < ActiveRecord::Migration
  def change
    add_column :web_contents, :disabled, :boolean
  end
end
