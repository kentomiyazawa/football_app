class AddBirthdayToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :birthday, :date
  end
end
