class CompetitionsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_competition, only: [:show, :edit, :update, :destroy]
  def index
    @comp = Competition.all
  end

  def show
    if user_signed_in?
      @part = Participation.where(competition_id: @competition.id)
      @participations = @part.find_by(user_id: current_user.id)
    end
  end

  def new
    @competition = Competition.new
  end

  def create
    @competition = Competition.new(competition_params)
    if @competition.save
      redirect_to @competition
    end
  end

  def edit
  end

  def update
    @competition.update(competition_params)
    redirect_to @competition
  end

  private

  def set_competition
    @competition = Competition.find(params[:id])
  end

  def competition_params
    params.require(:competition).permit(:name, :image, :rule, :award, :price, :max_entries)
  end
end
