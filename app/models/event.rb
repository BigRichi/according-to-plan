class Event < ApplicationRecord
  belongs_to :user, optional: true
  
  has_many :event_categories, dependent: :destroy
  has_many :categories, through: :event_categories
  has_many :photos, dependent: :destroy

  validates :title, presence: true
  

  def previous
    user.events.where(["date < ?", date]).order(:date).last
  end

  def next
    user.events.where(["date > ?", date]).order(:date).first
  end

  def days_until_or_since
    days = (self.date.to_datetime - DateTime.now).to_f.round
      if days.negative?
        "#{days.abs} day(s) since event"
      else 
        "#{days.abs} day(s) until event"
      end
  end

end
