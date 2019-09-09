class User < ApplicationRecord
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances, source: :attended_event
  has_many :events, class_name: 'Event', foreign_key: :creator_id
  has_many :invitations, foreign_key: :invited_by_id
  has_many :invited_bys, through: :invitations, source: :invited_by
  validates :username, presence: true
end
