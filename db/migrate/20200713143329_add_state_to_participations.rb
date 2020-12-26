class AddStateToParticipations < ActiveRecord::Migration[6.0]
  def change
    add_column :participations, :state, :string, default: 'pending'
  end
end
