class AddRuleToCompetitions < ActiveRecord::Migration[6.0]
  def change
    add_column :competitions, :rule, :text
  end
end
