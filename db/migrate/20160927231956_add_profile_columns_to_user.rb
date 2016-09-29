class AddProfileColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :alma_mater, :string
    add_column :users, :academic_discipline, :string
    add_column :users, :specific_discipline, :string
    add_column :users, :specialization, :string
    add_column :users, :topic_of_research, :string
    add_column :users, :level_of_education, :string
    add_column :users, :current_company, :string
    add_column :users, :current_position, :string
    add_column :users, :website, :string
    add_column :users, :opportunities, :string
  end
end
