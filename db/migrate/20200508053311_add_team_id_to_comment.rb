class AddTeamIdToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :team_id, :integer
  end
end
