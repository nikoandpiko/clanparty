class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  has_many :invites
  # has_one :team, -> { where user_id != nil }
  #  has_one_attached :avatar # for cloudinary only

  validates :username, presence: true

  def team
    Invite.accepted.find_by(user: self).team
  end

  def pending
    Invite.pending.find_by(user: self).team
  end

  def declined
    Invite.declined.find_by(user: self).team
  end
end
