class Event < ApplicationRecord
  belongs_to :user
  
  has_many :event_categories
  has_many :categories, through: :event_categories

 

end
