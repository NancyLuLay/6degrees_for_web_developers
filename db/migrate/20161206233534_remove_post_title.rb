class RemovePostTitle < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :post_title, :string
  end
end
