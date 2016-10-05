class AddBodyToOpportunity < ActiveRecord::Migration[5.0]
  def change
    add_column :opportunities, :body, :string
  end
end
