class ChangeProjectTimePeriodInputType1 < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :time_period, :datetime
    add_column :projects, :time_period, :string
  end
end
