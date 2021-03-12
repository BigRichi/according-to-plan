class Photo < ApplicationRecord
  belongs_to :event
  validates :picture_url, presence: true
end
