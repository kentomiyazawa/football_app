class Player < ApplicationRecord
  belongs_to :team
  validates :name, :position, :uniform_number, :footed, :height, :weight, :nationally, :birthday, presence: true
end