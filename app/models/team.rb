class Team < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :invites
  has_many :events
  #  has_one_attached :avatar # for cloudinary only

  validates :name, presence: true, uniqueness: true
  validates :avatar, presence: true
  validates :bio, presence: true
  validates :discord, presence: true
  validates :status, presence: true
  # validates :user_id, presence: true, uniqueness: true
  validates :user_id, presence: true
end
