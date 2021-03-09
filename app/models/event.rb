class Event < ApplicationRecord
  belongs_to :user
  
  has_many :event_categories
  has_many :categories, through: :event_categories

  def search(search)
    if search
      event = Event.find_by(date: search)
      if event
        self.where(event_id: event)
      else
        Event.all
      end
    else
      Event.all
    end
  end

end
