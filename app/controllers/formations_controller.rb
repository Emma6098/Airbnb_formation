class FormationsController < ApplicationController
  def index
    @formations = Formation.all
  end

  def show
    @formation = Formation.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @formation = Formation.new
  end

  def create
    @formation = Formation.new(formation_params)
    @formation.user = current_user
    @formation.save!
    redirect_to formation_path(@formation)
  end

  def edit
    @formation = Formation.find(params[:id])
  end

  def update
    @formation = Formation.find(params[:id])
    @formation.update(formation_params)
    redirect_to formation_path(@formation)
  end

  def destroy
    @formation = Formation.find(params[:id])
    @formation.destroy
    redirect_to formations_path(@formation), status: :see_other
  end

  private

  def formation_params
    params.require(:formation).permit(:title, :date, :description, :theme, :price, :photo_formation)
  end
end
