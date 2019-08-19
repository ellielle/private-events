class Event < ApplicationRecord
  has_many :creators, class_name: "User"
  validates :title, presence: true
  validates :body, presence: true
  validates :date, presence: true
  validates :location, presence: true
end
