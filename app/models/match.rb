class Match < ApplicationRecord
  has_many :games
  validates :name, :start_time, presence: true
end
