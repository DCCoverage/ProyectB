class UpdateUniqueIndexInShowTimes < ActiveRecord::Migration[6.0]
  def change
    remove_index :show_times, name: 'index_show_times_on_room_id_and_when'
    add_index :show_times, %i[room_id when date], unique: true
  end
end
