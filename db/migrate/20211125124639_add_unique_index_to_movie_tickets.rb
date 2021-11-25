class AddUniqueIndexToMovieTickets < ActiveRecord::Migration[6.0]
  def change
    add_index :movie_tickets, %i[show_time_id row column], unique: true
  end
end
