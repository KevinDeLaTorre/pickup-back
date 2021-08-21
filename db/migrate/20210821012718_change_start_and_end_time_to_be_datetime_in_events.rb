class ChangeStartAndEndTimeToBeDatetimeInEvents < ActiveRecord::Migration[6.0]
  def up
    remove_column :events, :start_time
    remove_column :events, :end_time
    add_column :events, :start_time, :datetime
    add_column :events, :end_time, :datetime
  end

  def down
    remove_column :events, :start_time
    remove_column :events, :end_time
    add_column :events, :start_time, :time
    add_column :events, :end_time, :time
  end
end
