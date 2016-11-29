class AddColumnsToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :location, :string
    add_column :projects, :time_period, :string
    add_column :projects, :source_code, :string
    add_column :projects, :project_url, :string
  end
end
