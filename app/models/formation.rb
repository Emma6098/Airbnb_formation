class Formation < ApplicationRecord
  belongs_to :user
  has_one_attached :photo_formation
  has_many :reservations, dependent: :destroy
end
