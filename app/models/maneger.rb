class Maneger < ApplicationRecord
  belongs_to :team
  validates :name,:birthday, :team_id, presence: true
  validates  :nationally, presence: true, format:{ with: /\A[a-z]+\z/ }
end
