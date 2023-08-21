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
    @reservation_delete = Reservation.find(params[:id])
    @reservation_delete.destroy
    redirect_to profile_path, status: :see_other
  end

  private

  def set_formation
    @formation = Formation.find(params[:formation_id])
  end

end
