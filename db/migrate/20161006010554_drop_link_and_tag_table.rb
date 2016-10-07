class DropLinkAndTagTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :links
    drop_table :tags
  end
end
