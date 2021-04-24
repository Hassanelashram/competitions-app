class VoteMailer < ApplicationMailer
  def verify_vote(vote_id)
    @vote = Vote.find(vote_id)
    mail(to: @vote.email, subject: 'Confirm your vote')
  end
end
