class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :calendar_date, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :address
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
