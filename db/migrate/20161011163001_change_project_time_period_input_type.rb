class ChangeProjectTimePeriodInputType < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :time_period, :string
    add_column :projects, :time_period, :datetime
  end
end
