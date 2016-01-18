class VenuesController < ApplicationController
  
  def new
    @venue = Venue.new
  end

  def create
     @venue = Venue.new(venue_params)
      if @venue.save
        redirect_to(venues_path)
      else
      render :new
    end

  end

  def update
    Venue.find(params[:id]).update(venue_params)
    redirect_to(venues_path)
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def destroy
  end

  def index
      if params[:search]
            @venues = Venue.search(params[:search]).order("created_at DESC")
            @search_item = params[:search]
          else
            @venues = Venue.all.order("created_at DESC")
          end
  end

  def show
    @venue = Venue.find(params[:id])
  end

private

def venue_params
     params.require(:venue).permit(:name, :image, :description, :loaction, :link, :capacity)
end



end
