class CreateShowTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :show_times do |t|

      t.timestamps
    end
  end
end
