class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @comp = Competition.active.order(created_at: :desc).limit(3)
    # @comp = Competition.joins(:participations).order("participations DESC").limit(3)
    @winners = Winner.all.limit(3)
    @participations = Rails.cache.fetch("most_popular_participations", expires_in: 1.hour) do
      Participation.most_viewed
    end
  end
end
