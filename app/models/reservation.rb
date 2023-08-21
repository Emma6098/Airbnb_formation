class Reservation < ApplicationRecord
  belongs_to :formation
  belongs_to :user
end
