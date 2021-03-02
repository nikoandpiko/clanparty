class AddNewColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :stats, :integer
  end
end
