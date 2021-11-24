class AddDateToShowTime < ActiveRecord::Migration[6.0]
  def change
    add_column :show_times, :date, :date
  end
end
