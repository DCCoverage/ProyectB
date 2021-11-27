class AddConstraintToSeatsNoOccupiedSeat < ActiveRecord::Migration[6.0]
  def change
    add_index :seats, %i[showtime_id row column], unique: true
  end
end
