class BookingsController < ApplicationController

  before_action :authenticate_user!

  def new
    @performance = Performance.find(params[:performance_id])
    @booking = Booking.new
  end

  def create
    
    tick_amount = booking_params[:tickets].to_i
    performance = Performance.find(params[:performance_id])
    seats_left = performance.remaining_capacity
    a = seats_left - tick_amount

      if a >= 0
        @booking = current_user.bookings.create(booking_params)
        redirect_to (root_path)
      else
        flash[:alert] = "Not enough tickets remain to support that booking only #{seats_left} seats left"
        redirect_to(new_performance_booking_path(Performance.find(params[:performance_id])))
      end

  end


  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
       params.require(:booking).permit(:performance_id, :user_id, :tickets)
  end

end
