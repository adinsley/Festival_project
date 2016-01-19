class BookingsController < ApplicationController

  before_action :authenticate_user!
  


  def new
    @performance = Performance.find(params[:performance_id])
    @booking = Booking.new
  end


  def create
    
    tick_amount = booking_params[:tickets].to_i

   
    @performance = Performance.find(params[:performance_id])
    seats_left = @performance.remaining_capacity
    a = seats_left - tick_amount

    

    if a >= 0 
      if Booking.overlap_check(@performance.start, @performance.finish).empty?
        @booking = current_user.bookings.new(booking_params)
          if @booking.save
            redirect_to(root_path)
          else
            render :new
          end
      else
        # redirect_to( confirm_performance_bookings_path, lala: 'lala' )
        @booking = current_user.bookings.new(booking_params)
          if @booking.save
            redirect_to( performance_booking_confirm_path(@performance, @booking) )
          else
            render :new
          end
      end
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

  def confirm
    @booking = Booking.find(params[:booking_id])
    @performance = Performance.find(params[:performance_id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to(performances_path)
  end

  private

  def booking_params
       params.require(:booking).permit(:performance_id, :user_id, :tickets)
  end

end
