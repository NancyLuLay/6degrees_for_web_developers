class AddSummaryGithubPhoneToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :summary, :string
    add_column :users, :github, :string
    add_column :users, :phone_number, :string
  end
end
