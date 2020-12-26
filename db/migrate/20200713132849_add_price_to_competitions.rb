class AddPriceToCompetitions < ActiveRecord::Migration[6.0]
  def change
    add_monetize :competitions, :price, currency: { present: false }
  end
end
