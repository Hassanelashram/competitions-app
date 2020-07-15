class AddEndDateToCompetitions < ActiveRecord::Migration[6.0]
  def change
    add_column :competitions, :end_date, :datetime
  end
end
