class CreateIntervals < ActiveRecord::Migration[7.1]
  def change
    create_table :intervals do |t|
      t.integer :maximum, null: false
      t.integer :minimum, null: false

      t.timestamps
    end
  end
end
