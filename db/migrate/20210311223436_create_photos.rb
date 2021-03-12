class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :picture_url
      t.belongs_to :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
