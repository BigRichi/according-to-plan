class Event < ApplicationRecord
  belongs_to :user
  belongs_to :calendar_date
  
  has_many :event_categories
  has_many :categories, through: :event_categories

end
