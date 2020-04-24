class Instrument < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  # validates :name, presence: true
  # validates :description, presence: true
  # validates :price_per_day, presence: true
  # validates :photo, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # reviews with 's', because Instrument has_many reviews
  # otherwise without, if Reviews has many instruments.

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :description ],
    associated_against: {
      reviews: [ :content ]
    },
    using: {
      tsearch: { prefix: true }
    }


end
