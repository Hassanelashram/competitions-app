class AddWinnerToCompetitions < ActiveRecord::Migration[6.0]
  def change
    add_column :competitions, :winner, :integer
  end
end
