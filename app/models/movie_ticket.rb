class MovieTicket < ApplicationRecord
  belongs_to :show_time
  validates :show_time,
            uniqueness: {
              scope: %i[row column],
              message: 'Este asiento ya está ocupado'
            }
end
