class CreateMovieTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_tickets do |t|
      t.belongs_to :show_time, null: false, foreign_key: true
      t.string :row
      t.integer :column

      t.timestamps
    end
  end
end
