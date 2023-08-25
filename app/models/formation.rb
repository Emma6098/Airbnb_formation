class Formation < ApplicationRecord
  belongs_to :user
  has_one_attached :photo_formation
  has_many :reservations, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :description, length: { minimum: 10, maximum: 1000 }
  validates :date, presence: true
  validates :end_date, presence: true
  validates :title, presence: true
  validates :theme, presence: true
  validates :price, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_theme_and_description,
  against: [ :theme, :description, :address ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
