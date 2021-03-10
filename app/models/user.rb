class User < ApplicationRecord
    has_many :events, dependent: :destroy
    has_many :calendar_dates, through: :events

    has_secure_password

    def upcoming_five_events
        events.sort_by(&:date).take(5)
    end


end
