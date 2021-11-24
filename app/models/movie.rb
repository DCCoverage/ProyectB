class Movie < ApplicationRecord
  has_many :show_times, dependent: :destroy
  has_one_attached :image
end
