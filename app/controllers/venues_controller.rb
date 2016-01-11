class VenuesController < ApplicationController
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
end
