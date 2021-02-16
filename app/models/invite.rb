class Invite < ApplicationRecord
  belongs_to :team
  belongs_to :user
  scope :accepted, -> { where(status: 1) }

  validates :status, presence: true
  # validates :requester, presence: true # doesnt necessarily has to be present
  # before_validation(on: :create) do
  # if self.team_id == self.accepted.find_by(team: self)
  #   if self.user_id == self.accepted.find_by(user: self)
  #     false
  #   end
  # end
  # end

  # OR
  before_validation :ensure_invitation_not_accepted_twice
  def ensure_invitation_not_accepted_twice
    unless self.team_id == Invite.find_by(team: self.team)
      unless self.user_id == Invite.find_by(user: self.user)
        true
      end
    end
  end
  # def one_team_only
  #   return unless status == 1
  # end
end
