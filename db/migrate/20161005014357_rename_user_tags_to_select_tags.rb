class RenameUserTagsToSelectTags < ActiveRecord::Migration[5.0]
  def change
    rename_table :user_tags, :select_tags
  end
end
