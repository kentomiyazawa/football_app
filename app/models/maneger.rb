class Maneger < ApplicationRecord
  belongs_to :team
  validates :birthday, :team_id, presence: true
  validates :name, :nationally, presence: true, format:{ with: /\A[a-z]+\z/ }
end
