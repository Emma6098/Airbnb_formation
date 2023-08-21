class ReservationsController < ApplicationController
  before_action :set_formation, only: %i[create]

  def create
    @reservation = Reservation.new
    @reservation.formation = @formation
    @reservation.user = current_user
    @reservation.statut = "en attente de validation"
    @reservation.save!
    redirect_to reservation_path(@reservation)
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path(@reservation.formation), status: :see_other
  end

  def accept

  end

  def reject

  end

  private

  def set_formation
    @formation = Formation.find(params[:formation_id])
  end

end
