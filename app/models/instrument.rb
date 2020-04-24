class Instrument < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :photo


  # with s, that means Instrument has_many reviews

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :description ],
    associated_against: {
      reviews: [ :content ]
    },
    using: {
      tsearch: { prefix: true }
    }

  # include PgSearch::Model
  # pg_search_scope :search_by_name_and_description,
  #   against: [ :name, :description ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }
end
