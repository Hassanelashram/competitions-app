require 'rails_helper'

RSpec.describe Referrals::CreateReferral, type: :service do
    subject { described_class.new(referrer.id, referred.id).call }
    let(:referrer) { create(:user) }
    let(:referred) { create(:user) }
    context "when service is called" do
        it "creates a referral" do
            subject

            expect(Referral.count).to eq 1
        end

        it "assigns credits to both users", aggregate_failures: true do
            subject 

            expect(Credit.count).to eq 2
            expect(referred.credits.sum(:amount)).to eq 4
            expect(referrer.credits.sum(:amount)).to eq 4
        end
    end


end
