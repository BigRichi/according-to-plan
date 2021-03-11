class Event < ApplicationRecord
  belongs_to :user, optional: true
  
  has_many :event_categories, dependent: :destroy
  has_many :categories, through: :event_categories

  validates :title, presence: true
  

  def previous
    user.events.where(["date < ?", date]).order(:date).last
  end

  def next
    user.events.where(["date > ?", date]).order(:date).first
  end

end
