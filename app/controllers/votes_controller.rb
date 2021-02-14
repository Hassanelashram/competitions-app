class VotesController < ApplicationController
  def create
    @part = Participation.find(params[:participation_id])
    @vote = Vote.new(vote_params)
    @vote.participation = @part
    redirect_to participation_path(@part)

    flash[:alert] = "You can only vote once" unless @vote.save
  end

  private

  def vote_params
    params.require(:vote).permit(:email)
  end
end
