class PaymentsController < ApplicationController
  def new
    @participation = current_user.participations.where(state: 'pending').find(params[:participation_id])
  end
end
