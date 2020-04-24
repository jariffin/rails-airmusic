class Instrument < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :photo


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
