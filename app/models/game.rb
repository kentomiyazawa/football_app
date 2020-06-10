class Game < ApplicationRecord
  belongs_to :home_team, class_name: 'Team', :foreign_key => 'home_team_id'
  belongs_to :away_team, class_name: 'Team', :foreign_key => 'away_team_id'
  belongs_to :match
  validates :start_time, :match_id, :home_team_id, :away_team_id, presence: true
end
