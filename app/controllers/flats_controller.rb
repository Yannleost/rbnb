class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

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
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to root
  end


  private
  def flat_params
    params.require(:flat).permit(:title, :description, :price, :capacity, :start_date, :end_date)
  end

end
