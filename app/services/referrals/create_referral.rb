module Referrals
    class CreateReferral
      def initialize(referrer_id, referred_id)
        @referrer = User.find_by(id: referrer_id)
        @referred = User.find_by(id: referred_id)
      end

      def call
        return unless referrer && referred
            
        referral = Referral.new(referrer: referrer, referred: referred)
        give_credits if referral.save
      end

      private

      attr_accessor :referrer, :referred

      def give_credits
        # todo find a better logic on when to assign credits to referrer
        Credit.create!(user: referrer, amount: 4)
        Credit.create!(user: referred, amount: 4)
      end
    end
  end
  