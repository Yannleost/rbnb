class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR address ILIKE :query"
      @flats = Flat.where(sql_query, query: "%#{params[:query]}%")
    else
      @flats = Flat.all
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.owner = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def show
    @flat = Flat.find(params[:id])
    # @flat = Flat.where.not(latitude: nil, longitude: nil)
    if @flat.latitude
      @markers = [{
        lat: @flat.latitude,
        lng: @flat.longitude
        }]
    end
  end


  def edit
    @flat = Flat.find(params[:id])
  end

  def update

    @flat = Flat.find(params[:id])
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path
  end


  private
  # protection des parametres se sont les strongs params
  def flat_params
    params.require(:flat).permit(:title, :description, :price, :capacity, :start_date, :end_date, :address, :photo)
  end

end
