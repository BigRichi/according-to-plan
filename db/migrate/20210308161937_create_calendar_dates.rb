class CreateCalendarDates < ActiveRecord::Migration[6.1]
  def change
    create_table :calendar_dates do |t|
      t.datetime :calendar_date

      t.timestamps
    end
  end
end
