class ParticipationsController < ApplicationController

  def show
    @participation = Participation.find(params[:id])
  end
  def create
    @comp = Competition.find(params[:competition_id])
    @participation = Participation.create!(user_id: current_user.id, competition_id: @comp.id, amount: @comp.price)
    if @participation.save
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
        name: "Booking for #{@comp.name}",
        amount: @comp.price_cents,
        currency: 'usd',
        quantity: 1
        }],
        success_url: edit_participation_url(@participation),
        cancel_url: root_url
      )
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

  private
  def participation_params
    params.require(:participation).permit(:image)
  end
end
