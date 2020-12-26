class AddImageToCompetitions < ActiveRecord::Migration[6.0]
  def change
    add_column :competitions, :image, :string
  end
end
