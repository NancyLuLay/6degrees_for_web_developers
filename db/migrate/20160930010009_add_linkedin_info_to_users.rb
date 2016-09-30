class AddLinkedinInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :linkedin_token, :string
    add_column :users, :linkedin_secret, :string
    add_column :users, :linkedin_raw_info, :text
    add_index :users, [:uid, :provider]
  end
end
