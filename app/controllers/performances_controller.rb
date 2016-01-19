class PerformancesController < ApplicationController
  
  def new
    @performance = Performance.new
    @venues = Venue.all
    @genres = Genre.all
    @shows = Show.all
  end

  def create
    @performance = Performance.new(performance_params)
    @venues = Venue.all
    @genres = Genre.all
    @shows = Show.all
      
    
      @performance = Performance.new(performance_params)
      if Performance.overlap_check(@performance.venue_id, @performance.start, @performance.finish).empty? 
          if @performance.save
            redirect_to(performances_path)
          else
            render :new
          end
      else
          flash[:alert] = "Venue already booked at this time"
          redirect_to(new_performance_path)
      end
  end

  def update
    
    performance1 = Performance.find(params[:id])
    start = performance1.start
    finish = performance1.finish
    id = performance1.id

    performance2 = Performance.new(performance_params)

    performance1.update({start:nil, finish:nil})


      if Performance.overlap_check(performance1.venue_id, performance2.start, performance2.finish).empty? 
        performance1.update(performance_params)
        redirect_to(performances_path)
      else
        performance1.update({start:start, finish:finish})
        flash[:alert] = "You can not update to that time venue already booked at this time"
        redirect_to performance_path(performance_params)
      
      end
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
    @performances = Performance.all.order("created_at DESC")
  end

  def show
    @performance = Performance.find(params[:id])
  end

  private

   def performance_params
     params.require(:performance).permit(:genre_id, :show_id, :venue_id, :price, :restrictions, :description, :start, :finish )
   end

end
