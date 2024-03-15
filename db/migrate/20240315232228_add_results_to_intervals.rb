class AddResultsToIntervals < ActiveRecord::Migration[7.1]
  def change
    add_column :intervals, :results, :integer, array: true, default: []
  end
end
