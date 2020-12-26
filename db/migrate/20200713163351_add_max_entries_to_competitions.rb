class AddMaxEntriesToCompetitions < ActiveRecord::Migration[6.0]
  def change
    add_column :competitions, :max_entries, :integer
  end
end
