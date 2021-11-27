class AddConstraintToShowtimeNoSameRoomTime < ActiveRecord::Migration[6.0]
  def change
    add_index :show_times, %i[room_id when], unique: true
  end
end
