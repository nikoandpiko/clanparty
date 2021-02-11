class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :nickname, :string
    add_column :users, :avatar, :string
    add_column :users, :bio, :text
    add_column :users, :discord, :string
    add_column :users, :role, :string
    add_column :users, :sunday_start, :time
    add_column :users, :sunday_end, :time
    add_column :users, :monday_start, :time
    add_column :users, :monday_end, :time
    add_column :users, :tuesday_start, :time
    add_column :users, :tuesday_end, :time
    add_column :users, :wednesday_start, :time
    add_column :users, :wednesday_end, :time
    add_column :users, :thursday_start, :time
    add_column :users, :thursday_end, :time
    add_column :users, :friday_start, :time
    add_column :users, :friday_end, :time
    add_column :users, :saturday_start, :time
    add_column :users, :saturday_end, :time
    add_reference :users, :team, foreign_key: true
  end
end
