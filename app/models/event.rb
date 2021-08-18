class Event < ApplicationRecord
    validates :title, presence: true
    validates :date, presence: true
    validates :start_time, presence: true
end
