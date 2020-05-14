class AddStartTimeToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :start_time, :date
  end
end
