class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
# ici on dit que la personne doit pouvoir etre authentifiée pour acceder à ces methodes.
# sauf pour la page index qui est la page d'acceuiel
  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.owner = current_user
    @flat.save
    redirect_to flat_path(@flat)
  end

  def show
    @flat = Flat.find(params[:id])
  end


  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    redirect_to flat_path
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path
  end


  private
  # protection des parametres se sont les strongs params
  def flat_params
    params.require(:flat).permit(:title, :description, :price, :capacity, :start_date, :end_date)
  end

end
