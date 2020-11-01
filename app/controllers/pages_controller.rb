class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @comp = Competition.order(created_at: :desc).limit(3)
    #@comp = Competition.joins(:participations).order("participations DESC").limit(3)
    @winners = Winner.all.limit(3)
  end

  def dashboard
    @part_count = current_user.participations.count
    @vote_count = current_user.votes_received
  end
end
