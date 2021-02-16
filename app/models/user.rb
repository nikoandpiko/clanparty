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
    # invites.find_by{sta"Accepted"}
    # status == "Accepted"
    # Invite.accepted.where(user: self).team
    Invite.accepted.find_by(user: self).team
  end
end
