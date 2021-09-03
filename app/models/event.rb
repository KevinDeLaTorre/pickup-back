class Event < ApplicationRecord
    validates :title, presence: true
    validates :date, presence: true
    validates :start_time, presence: true
    has_many :passive_relationships, class_name: "EventLink", foreign_key: "event_id", dependent: :destroy
    has_many :followers, through: :passive_relationships, source: :user
end
