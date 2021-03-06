class CompetitionsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_competition, only: %i[show edit update destroy]

  def index
    @comp = Competition.active
    @categories = Competition::ALLOWED_CATEGORIES
    case params[:sorting]
    when "entrance"
      @comp = @comp.order(price_cents: :asc)
    when "award"
      @comp = @comp.order(award: :desc)
    when "ending"
      @comp = @comp.order(end_date: :asc)
    end
    
    @comp = @comp.where(category: params[:category]) if params[:category].present?
  end

  def show
    if user_signed_in?
      @part = Participation.where(competition_id: @competition.id)
      @participations = @part.find_by(user_id: current_user.id)
    end

    respond_to do |format|
      format.html
      format.json { render json: { participations: @competition.participations } }
    end
  end

  def new
    @competition = Competition.new
  end

  def create
    @competition = Competition.new(competition_params)
    redirect_to @competition if @competition.save
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
    params.require(:competition).permit(:name, :image, :rule, :award, :price, :max_entries,
                                        :category, :end_date)
  end
end
