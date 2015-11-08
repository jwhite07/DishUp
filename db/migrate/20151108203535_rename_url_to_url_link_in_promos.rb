class RenameUrlToUrlLinkInPromos < ActiveRecord::Migration
  def change
    rename_column :promos, :url, :link_url
  end
end
