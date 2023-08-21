class ReservationsController < ApplicationController
  before_action :set_user, only: %i[new create]

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.formation = @formation
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

  def reservation_params
    params.require(:reservation).permit(:statut, :user_id)
  end

  def set_formation
    @formation = Formation.find(params[:formation_id])
  end

end
