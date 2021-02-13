require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#full_name" do
    let!(:user) { create(:user, first_name: "John", last_name: "Doe") }
    it "interpolates the first name and last name" do
      expect(user.full_name).to eq "John Doe"
    end
  end

  describe "#money_earned" do
    let(:competition) { create(:competition, award: 44) }
    let!(:winner) { create(:winner, competition: competition) }
    it "returns the sum of the award of all competitions won" do 
      expect(User.first.money_earned).to eq 44
    end
  end

  describe "#money_spent" do
    let!(:user) { participation.user }
    let(:participation) { create(:participation, amount_cents: 200)} 
    let!(:participation2) { create(:participation, user: user, amount_cents: 200)} 
    it "returns the sum of the price of all participations" do 
      expect(User.first.money_spent).to eq 4
    end
  end
end
