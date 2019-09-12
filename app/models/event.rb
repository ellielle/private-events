class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :attendee
  belongs_to :creator, class_name: "User"
  has_many :invitations, foreign_key: :invited_event_id
  has_many :invited_events, through: :invitations, source: :invited_event
  validates :title, presence: true
  validates :body, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validate :not_past_date
  scope :upcoming, -> { where("date > ?", Time.now).order(:date) }
  scope :past, -> { where("date < ?", Time.now).order(:date) }

  private

  def not_past_date
    if self.date < DateTime.now
      errors.add(:date, " cannot be in the past.")
    end
  end
end
