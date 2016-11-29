class ModifyUserSummaryType < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :summary, :string
    add_column :users, :summary, :text
  end
end
