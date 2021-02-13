class Invite < ApplicationRecord
  belongs_to :team
  belongs_to :user

  validates :status, presence: true
  validates :requester, presence: true
end
