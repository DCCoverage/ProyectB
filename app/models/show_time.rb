class ShowTime < ApplicationRecord
  belongs_to :movie
  belongs_to :room

  has_many :movie_tickets, dependent: :destroy

  enum when: %i[morning afternoon evening]
end
