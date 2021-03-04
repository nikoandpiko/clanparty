class Invite < ApplicationRecord
  belongs_to :team
  belongs_to :user
  scope :accepted, -> { where(status: 1) } # accepted
  scope :pending, -> { where(status: 2) } # pending
  # scope :unassigned, -> { where(status: 3) } # hasn't applied
  scope :declined, -> { where(status: 0) } # declined

  validates :status, presence: true
  validates :team, uniqueness: { scope: :user } # only allows 1 invite per user per team
  # example: User1 wants to join Team1 and gets declined(status 0). If he wants to try to join again he can not since
  # invite ID with same user and team already exists.
  # validates :requester, presence: true # doesnt necessarily has to be present
end
