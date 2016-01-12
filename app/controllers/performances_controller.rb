class PerformancesController < ApplicationController
  
  def new
    @performance = Performance.new
    @venues = Venue.all
    @genres = Genre.all
    @shows = Show.all
  end

  def create
    if Performance.overlap_check(params[:venue_id], params[:start], params[:finish]).empty?
      performance.save
      redirect_to(performances_path)
    else
      flash[:alert] = "Venue already booked at this time"
      redirect_to(new_performance_path)
    end
  end

  def update
    Performance.find(params[:id]).update(performance_params)
    redirect_to performances_path
  end

  def edit
    @performance = Performance.find(params[:id])
    @venues = Venue.all
    @genres = Genre.all
    @shows = Show.all
  end

  def destroy
    performance = Performance.find(params[:id])
    performance.destroy
    redirect_to( performances_path )
    
  end

  def index
      if params[:search]
            @performances = Performance.search(params[:search]).order("created_at DESC")
            @search_item = params[:search]
          else
            @performances = Performance.all.order("created_at DESC")
          end
    end

  def show
    @performance = Performance.find(params[:id])
  end

  private

   def performance_params
     params.require(:performance).permit(:genre_id, :show_id, :venue_id, :price, :restrictions, :description, :start, :show )
   end

end
