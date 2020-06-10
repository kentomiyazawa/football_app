class Team < ApplicationRecord
  attachment :image
  has_many :comments
  has_many :user_teams
  has_many :users, through: :user_teams
  has_many :players
  has_one :maneger
  has_many :home_team_games, class_name: 'Game', :foreign_key => 'home_team_id'
  has_many :away_team_games, class_name: 'Game', :foreign_key => 'away_team_id'
  validates  :home, presence: true, format:{ with: /\A[a-z]+\z/ }
  validates :name, :stadium,:founding_year, presence: true
  
end
