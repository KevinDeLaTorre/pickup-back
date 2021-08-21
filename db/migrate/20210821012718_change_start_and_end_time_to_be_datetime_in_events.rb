class ChangeStartAndEndTimeToBeDatetimeInEvents < ActiveRecord::Migration[6.0]
  def change
    def up
      change_column :events, :start_time, :datetime
      change_column :events, :end_time, :datetime
    end

    def down
      change_column :events, :start_time, :time
      change_column :events, :end_time, :time
    end
  end
end
