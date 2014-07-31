class Profile < ActiveRecord::Base

  validates :user_id, presence: true
  validates :name, :location, presence: true

  belongs_to :user

  geocoded_by :location
  after_validation :geocode
end
