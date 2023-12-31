class FormationsController < ApplicationController

  def index
      if params[:keyword]
        @formations = Formation.search_by_theme_and_description(params[:keyword])
      else
        @formations = Formation.all
      end
      @expired_formations = Formation.where('end_date < ?', Date.today)
  end

  def show
    @formation = Formation.find(params[:id])
    @reservation = Reservation.new
    @marker = {
      lat: @formation.latitude,
      lng: @formation.longitude
      }
  end

  def new
    @formation = Formation.new
  end

  def create
    @formation = Formation.new(formation_params)
    @formation.user = current_user
    if @formation.save
      redirect_to formation_path(@formation)
    else
      render :new, status: :unprocessable_entity
    end
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
    params.require(:formation).permit(:title, :date, :end_date, :description, :theme, :price, :photo_formation, :address, :longitude, :latitude, :distance, :quota)
  end
end
