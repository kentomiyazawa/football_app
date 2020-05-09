class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.string :uniform_number
      t.string :footed
      t.integer :age
      t.integer :height
      t.integer :weight
      t.string :nationally

      t.timestamps
    end
  end
end
