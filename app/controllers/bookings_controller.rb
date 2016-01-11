class BookingsController < ApplicationController

  before_action :authenticate_user!
  def new
    @performance = Performance.find(params[:performance_id])
    @booking = Booking.new
  end

  def create
    @booking = current_user.bookings.create(booking_params)
    redirect_to (root_path)
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
       params.require(:booking).permit(:performance_id, :user_id, :tickets)
     end
end
