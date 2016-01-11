class BookingsController < ApplicationController

  before_action :authenticate_user!
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
       params.require(:booking).permit(:performance_id, :user_id, :tickets, :performance)
     end
end
