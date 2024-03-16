class AddResultsToIntervals < ActiveRecord::Migration[7.1]
  def change
    # Añadimos atributo results al modelo, de tipo array
    add_column :intervals, :results, :integer, array: true, default: []
  end
end
