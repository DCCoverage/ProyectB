class CreateShowTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :show_times do |t|
      t.belongs_to :movie, null: false, foreign_key: true
      t.belongs_to :room, null: false, foreign_key: true
      t.integer :when

      t.timestamps
    end
  end
end
