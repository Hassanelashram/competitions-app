class VoteMailer < ApplicationMailer
    
    def verify_vote(email)
        mail(to: email, subject: 'Confirm your vote')
    end

end
  