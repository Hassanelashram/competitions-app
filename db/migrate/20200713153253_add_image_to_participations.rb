class AddImageToParticipations < ActiveRecord::Migration[6.0]
  def change
    add_column :participations, :image, :string
  end
end
