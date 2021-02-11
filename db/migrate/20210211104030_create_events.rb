class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.column :start_time, :time
      t.column :end_time, :time
      t.integer :day
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
