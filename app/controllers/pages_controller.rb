class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @comp = Competition.active.order(created_at: :desc).limit(3)
    #@comp = Competition.joins(:participations).order("participations DESC").limit(3)
    @winners = Winner.all.limit(3)
  end
end
