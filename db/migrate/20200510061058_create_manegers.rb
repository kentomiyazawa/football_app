class CreateManegers < ActiveRecord::Migration[5.2]
  def change
    create_table :manegers do |t|
      t.string :name
      t.date :birthday
      t.string :nationally
      t.integer :team_id
      t.timestamps
    end
  end
end
