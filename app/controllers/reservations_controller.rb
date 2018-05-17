

class ReservationsController < ApplicationController
 skip_before_action :authenticate_user!

 def new
   @flat = Flat.find(params[:flat_id])
   @reservation = Reservation.new
   authorize @reservation
 end
# ici le user a été renommé client dans le model flat
def create
  @reservation = Reservation.new(reservation_params)
  authorize @reservation
  @reservation.flat = Flat.find(params[:flat_id])
  @reservation.client = current_user
  @reservation.save
  redirect_to flat_reservation_path(@reservation.flat, @reservation)
end

def show
  @reservation = Reservation.find(params[:id])
  authorize @reservation
end

private
# protection des parametres se sont les strongs params
def reservation_params
  params.require(:reservation).permit(:start_date, :end_date)
end

end

