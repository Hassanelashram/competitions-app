class AddVerifiedToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :verified, :boolean, default: false
  end
end
