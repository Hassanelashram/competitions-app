class VotesController < ApplicationController

  def create
    @part = Participation.find(params[:participation_id])
    @vote = Vote.new(vote_params)
    @vote.participation = @part
    if @vote.save
      redirect_to participation_path(@part)
    else
      redirect_to participation_path(@part)
      flash[:alert] = "You can only vote once"
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:email)
  end
end
