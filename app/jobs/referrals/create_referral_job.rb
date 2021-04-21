module Referrals
  class CreateReferralJob < ApplicationJob
      queue_as :default
    
      def perform(referrer_id, referred_id)
        Referrals::CreateReferral.new(referrer_id, referred_id).call
      end
    end
  end
  