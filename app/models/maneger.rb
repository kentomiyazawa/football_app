class Maneger < ApplicationRecord
  belongs_to :team
  validates :name, :birthday, :nationally, presence: true
end
