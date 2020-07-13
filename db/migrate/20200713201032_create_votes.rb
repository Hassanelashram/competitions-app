class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :participation, null: false, foreign_key: true
      t.string :email

      t.timestamps
    end
  end
end
