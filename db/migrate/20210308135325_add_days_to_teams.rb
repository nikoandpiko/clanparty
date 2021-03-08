class AddDaysToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :monday, :boolean, :default => false
    add_column :teams, :tuesday, :boolean, :default => false
    add_column :teams, :wednesday, :boolean, :default => false
    add_column :teams, :thursday, :boolean, :default => false
    add_column :teams, :friday, :boolean, :default => false
    add_column :teams, :saturday, :boolean, :default => false
    add_column :teams, :sunday, :boolean, :default => false
  end
end
