class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :creators, class_name: "User"
  validates :title, presence: true
  validates :body, presence: true
  validates :date, presence: true
  validates :location, presence: true
end
