class ReservationsController < ApplicationController
 skip_before_action :authenticate_user!
def new
   @reservation = Reservation.new
end
# ici le user a été renommé client dans le model flat
def create
  @reservation = Reservation.new(reservation_params)
  @reservation.client = current_user
  @reservation.save
end
private
# protection des parametres se sont les strongs params
def reservation_params
  params.require(:reservation).permit( :start_date, :end_date)
end

end
