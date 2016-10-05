class RemoveColumnImageFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :image
  end
end
