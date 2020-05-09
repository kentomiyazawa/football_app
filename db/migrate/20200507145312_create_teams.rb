class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :home, null: false
      t.string :stadium, null: false
      t.integer :founding_year, null: false
      t.string :image_id

      t.timestamps
    end
  end
end
