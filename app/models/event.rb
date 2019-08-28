class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :attendee
  belongs_to :creator, class_name: "User"
  validates :title, presence: true
  validates :body, presence: true
  validates :date, presence: true
  validates :location, presence: true
end
