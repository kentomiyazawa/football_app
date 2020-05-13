class RemoveUniformNumberFromPlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :uniform_number, :string
  end
end
