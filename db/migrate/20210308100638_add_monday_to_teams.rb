class AddMondayToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :monday_start, :string
    add_column :teams, :tuesday_start, :string
    add_column :teams, :wednesday_start, :string
    add_column :teams, :thursday_start, :string
    add_column :teams, :friday_start, :string
    add_column :teams, :saturday_start, :string
    add_column :teams, :sunday_start, :string
    add_column :teams, :monday_end, :string
    add_column :teams, :tuesday_end, :string
    add_column :teams, :wednesday_end, :string
    add_column :teams, :thursday_end, :string
    add_column :teams, :friday_end, :string
    add_column :teams, :saturday_end, :string
    add_column :teams, :sunday_end, :string
  end
end
