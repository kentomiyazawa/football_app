class Team < ApplicationRecord
  attachment :image
  has_many :comments
  has_many :user_teams
  has_many :users, through: :user_teams
  has_many :team_players
  has_many :players, through: :team_players
end
