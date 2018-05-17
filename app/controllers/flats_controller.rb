class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index


# ici on dit que la personne doit pouvoir etre authentifiée pour acceder à ces methodes.
# sauf pour la page index qui est la page d'acceuiel
  def index
    @flats = Flat.all
    @flats = policy_scope(Flat)
    if params[:query].present?
      sql_query = "title ILIKE :query OR address ILIKE :query"
      @flats = Flat.where(sql_query, query: "%#{params[:query]}%")
    else
      @flats = Flat.all
    end
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    authorize @flat
    @flat.owner = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def show
    @flat = Flat.find(params[:id])
    authorize @flat
    if @flat.latitude
      @markers = [{
        lat: @flat.latitude,
        lng: @flat.longitude
        }]
    end
  end


  def edit
    @flat = Flat.find(params[:id])
    authorize @flat
  end

  def update

    @flat = Flat.find(params[:id])
    authorize @flat
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    authorize @flat
    @flat.destroy
    redirect_to flats_path
  end


  private
  # protection des parametres se sont les strongs params
  def flat_params
    params.require(:flat).permit(:title, :description, :price, :capacity, :start_date, :end_date, :address, :photo)
  end

end
