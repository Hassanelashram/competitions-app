class AddAwardToCompetitions < ActiveRecord::Migration[6.0]
  def change
    add_column :competitions, :award, :integer
  end
end
