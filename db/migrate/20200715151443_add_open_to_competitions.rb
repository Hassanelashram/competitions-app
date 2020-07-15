class AddOpenToCompetitions < ActiveRecord::Migration[6.0]
  def change
    add_column :competitions, :open, :boolean, default: true
  end
end
