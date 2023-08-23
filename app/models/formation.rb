class Formation < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :description, length: { minimum: 10, maximum: 1000 }
  validates :date, presence: true
  validates :title, presence: true
  validates :theme, presence: true
end
