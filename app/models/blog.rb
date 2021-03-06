class Blog < ApplicationRecord
  belongs_to :user
  has_many :blogcomments
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  validates :title, :text, :user_id,presence: true
end
