class Player < ApplicationRecord
  belongs_to :team
  validates :name, :nationally, presence: true, format:{ with: /\A[a-z]+\z/ }
  validates  :position, :uniform_number, :footed, :height, :weight, :birthday, :team_id, presence: true
end