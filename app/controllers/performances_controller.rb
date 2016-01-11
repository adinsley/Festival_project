class PerformancesController < ApplicationController
  
  def new
    @performance = Performance.new
    @venues = Venue.all
    @genres = Genre.all
    @shows = Show.all
  end

  def create
    Performance.create(performance_params)
    redirect_to(performances_path)
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
     params.require(:performance).permit(:genre_id, :show_id, :venue_id, :date, :price, :restrictions, :description)
   end

end
