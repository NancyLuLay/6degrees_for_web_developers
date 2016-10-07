class RenameColumnWebsiteToCurrentWebsite < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :website, :current_website
  end
end
