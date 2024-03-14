class CreateIntervals < ActiveRecord::Migration[7.1]
  def change
    create_table :intervals do |t|
      t.integer :minimum
      t.integer :maximum

      t.timestamps
    end
  end
end
