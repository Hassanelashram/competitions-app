class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @comp = Competition.all.limit(3)
    @part = Participation.all.limit(3)
  end
end
