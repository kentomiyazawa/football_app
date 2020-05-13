class AddUniformNumberToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :uniform_number, :integer
  end
end
