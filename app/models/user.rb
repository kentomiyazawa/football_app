class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :user_teams
  has_many :teams, through: :user_teams
  has_many :blogs
  has_many :blogcomments
  has_many :likes, dependent: :destroy
  has_many :liked_blogs, through: :likes, source: :blog
  validates :name, presence: true, uniqueness: true       
end
