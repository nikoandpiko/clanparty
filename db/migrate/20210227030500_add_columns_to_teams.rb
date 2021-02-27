class AddColumnsToTeams < ActiveRecord::Migration[6.0]
  def change
    # remove the old foreign_key
    remove_foreign_key :teams, :users
    # add the new foreign_key
    add_foreign_key :teams, :users, on_delete: :cascade
  end
end
