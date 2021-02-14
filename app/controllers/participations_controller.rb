class ParticipationsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def show
    @participation = Participation.find(params[:id])
    create_view(@participation)
    @suggestions = @participation.competition.recommendations.where.not(id: @participation.competition.id)
  end

  def create
    @comp = Competition.find(params[:competition_id])
    @participation = Participation.new(user_id: current_user.id, competition_id: @comp.id, amount: @comp.price)
    if @participation.save
      session = stripe_checkout(@comp, @participation)
      @participation.update(checkout_session_id: session.id)
      redirect_to new_participation_payment_path(@participation.id)
    else
      redirect_to root_url
    end
  end

  def edit
    @participation = Participation.find(params[:id])
  end

  def update
    @participation = Participation.find(params[:id])
    @participation.update(participation_params)
    redirect_to competition_path(@participation.competition_id)
  end

  def cancel_stripe
    participation = Participation.find(params[:id])
    participation.destroy
    redirect_to participation.competition
  end

  private

  def stripe_checkout(competition, participation)
    Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Booking for #{competition.name}", amount: competition.price_cents,
        currency: 'usd', quantity: 1
      }],
      success_url: edit_participation_url(participation),
      cancel_url: cancel_stripe_url(participation)
    )
  end

  def create_view(participation)
    return if current_user == participation.user
    return participation.views.create! if Rails.env["development"]

    participation.views.create!(country: request.location.country, city: request.location.country)
  end

  def participation_params
    params.require(:participation).permit(:photo)
  end
end
