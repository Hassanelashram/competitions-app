class CreateViews < ActiveRecord::Migration[6.0]
  def change
    create_table :views do |t|
      t.references :participation, null: false, foreign_key: true
      t.string :country
      t.string :city

      t.timestamps
    end
  end
end
