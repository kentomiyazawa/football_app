class Team < ApplicationRecord
  attachment :image
  has_many :comments
  has_many :user_teams
  has_many :users, through: :user_teams
  has_many :players
  has_one :maneger
  validates :name, :home, :stadium, :founding_year, presence: true
end
