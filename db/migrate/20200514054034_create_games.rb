class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.time :start_time, null: false
      t.references :match, foreign_key: true, null: false
      t.references  :home_team, foreign_key: { to_table: :teams }, null: false
      t.references  :away_team, foreign_key: { to_table: :teams }, null: false
      t.timestamps
    end
  end
end
