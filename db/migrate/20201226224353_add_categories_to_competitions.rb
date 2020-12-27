class AddCategoriesToCompetitions < ActiveRecord::Migration[6.0]
  def change
    add_column :competitions, :category, :string
  end
end
