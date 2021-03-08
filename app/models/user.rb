class User < ApplicationRecord
    has_many :events
    has_many :calendar_dates, through: :events

    has_secure_password
end
