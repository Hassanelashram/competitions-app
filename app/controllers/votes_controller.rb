class VotesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    @vote = Vote.find(params[:id])
    @vote.update(verified: true)
    redirect_to participation_path(@vote.participation_id)
    flash[:alert] = "Vote confirmed"
  end

  def create
    @part = Participation.find(params[:participation_id])
    @vote = Vote.new(vote_params)

    @vote.participation = @part
    redirect_to participation_path(@part)
    if @vote.save
      VoteMailer.verify_vote(@vote.id).deliver_now
    else
      flash[:alert] = "You can only vote once"
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:email, :verified)
  end
end
