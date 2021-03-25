class ChangeTeamAvatarToDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :teams, :avatar, Faker::Avatar.image
  end
end
