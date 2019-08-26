class Event < ApplicationRecord
  has_many :creators, class_name: "User"
  after_validation :set_slug, only: :create
  validates :title, presence: true
  validates :body, presence: true
  validates :date, presence: true
  validates :location, presence: true

  #TODO REMOVE BELOW
  def to_param
    "#{id}-#{slug}"
  end

  private

  def set_slug
    self.slug = title.to_s.parameterize
  end
end
