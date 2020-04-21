class Instrument < ApplicationRecord
  belongs_to :user
  has_many :reviews, :bookings
  has_one_attached :photo
end
