require 'rails_helper'

RSpec.describe Views::CreateView, type: :service do
  subject { described_class.new(participation.id, country, ip_address).call }
  let(:participation) { create(:participation) }
  let(:country) { "CH" }
  let(:ip_address) { "127.169.222" }

  context "when service is called" do
    it "creates a view" do
      subject

      expect(View.count).to eq 1
    end
    context "but the ip_address already viewed this record" do
      let!(:view) { create(:view, participation: participation) }
      let(:ip_address) { view.ip_address }
      it "does not create a view" do
        subject

        expect(View.count).to eq 1
      end
    end
  end
end
