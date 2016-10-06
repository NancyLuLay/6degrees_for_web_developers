class DropColumnsFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :alma_mater
    remove_column :users, :academic_discipline
    remove_column :users, :specific_discipline
    remove_column :users, :specialization
    remove_column :users, :topic_of_research
    remove_column :users, :level_of_education
    remove_column :users, :opportunities
  end
end
