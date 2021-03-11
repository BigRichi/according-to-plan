class EventCategory < ApplicationRecord
  belongs_to :event
  belongs_to :category

  validates :category_id, uniqueness: {scope: :event_id, message: "is already taken"}
end
