class RemoveColumnsFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :calendar_date_id, :integer
    remove_column :events, :start_time, :datetime
    remove_column :events, :end_time, :datetime
  end
end
