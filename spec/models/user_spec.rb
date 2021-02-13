require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#full_name" do
    let!(:user) { create(:user, first_name: "John", last_name: "Doe") }
    it "interpolates the first name and last name" do
      expect(user.full_name).to eq "John Doe"
    end
  end
end
