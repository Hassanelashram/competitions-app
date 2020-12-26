class AddAmountToParticipations < ActiveRecord::Migration[6.0]
  def change
    add_monetize :participations, :amount, currency: { present: false }
    add_column :participations, :checkout_session_id, :string
  end
end
