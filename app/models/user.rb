class User < ApplicationRecord
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances
  has_many :events, class_name: 'Event', foreign_key: :creator_id
  validates :username, presence: true
end
