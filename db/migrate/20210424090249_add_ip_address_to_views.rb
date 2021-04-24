class AddIpAddressToViews < ActiveRecord::Migration[6.0]
  def change
    add_column :views, :ip_address, :string
    add_index :views, [:participation_id, :ip_address], name: :unique_view_per_participation, unique: true
  end
end
