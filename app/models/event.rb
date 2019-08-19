class Event < ApplicationRecord
  has_many :creators, class_name: "User", source: :user, foreign_key: :creator_id
  validates :title, presence: true
  validates :body, presence: true
  validates :date, presence: true
  validates :location, presence: true
end
