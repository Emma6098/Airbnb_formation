class Formation < ApplicationRecord
  belongs_to :user
  has_one_attached :photo_formation
  has_many :reservations, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :description, length: { minimum: 10, maximum: 1000 }
  validates :date, presence: true
  validates :title, presence: true
  validates :theme, presence: true
end
