class RenameTableSelectTagsToLinks < ActiveRecord::Migration[5.0]
  def change
    rename_table :select_tags, :links
  end
end
