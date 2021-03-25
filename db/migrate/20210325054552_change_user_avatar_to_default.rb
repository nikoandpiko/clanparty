class ChangeUserAvatarToDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :avatar, Faker::Avatar.image
  end
end
