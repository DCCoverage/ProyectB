class CreateSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :seats do |t|
      t.string :row
      t.integer :column
      t.references :show_time, null: false, foreign_key: true

      t.timestamps
    end
  end
end
