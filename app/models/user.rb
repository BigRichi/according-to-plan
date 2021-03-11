class User < ApplicationRecord
    has_many :events, dependent: :destroy
    has_many :calendar_dates, through: :events

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum: 4, maximum: 11}, format: {without: /\s/}

    has_secure_password

    def upcoming_five_events
        events.sort_by(&:date).take(5)
    end


end
