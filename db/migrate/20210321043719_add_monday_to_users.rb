class AddMondayToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :monday, :boolean, :default => false
    add_column :users, :tuesday, :boolean, :default => false
    add_column :users, :wednesday, :boolean, :default => false
    add_column :users, :thursday, :boolean, :default => false
    add_column :users, :friday, :boolean, :default => false
    add_column :users, :saturday, :boolean, :default => false
    add_column :users, :sunday, :boolean, :default => false
  end
end
