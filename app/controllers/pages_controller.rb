class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end


  def profile
  end

  def accept
    @reservation_accept = Reservation.find(params[:reservation_id])
    @reservation_accept.update!(statut: "validé")
    redirect_to profile_path
  end

  def reject
    @reservation_reject = Reservation.find(params[:reservation_id])
    @reservation_reject.update!(statut: "rejeté")
    redirect_to profile_path
  end

  def destroy
    @reservation_delete = Reservation.find(params[:id])
    @reservation_delete.destroy
    redirect_to reservations_path(@reservation.formation), status: :see_other
  end
end
