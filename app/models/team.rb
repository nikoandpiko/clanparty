class Team < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :invites
  has_many :events

  validates :name, presence: true, uniqueness: true
  validates :avatar, presence: true
  validates :bio, presence: true
  validates :discord, presence: true
  validates :status, presence: true
end
