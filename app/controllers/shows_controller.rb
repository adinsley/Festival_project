class ShowsController < ApplicationController
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
          @shows = Show.search(params[:search]).order("created_at DESC")
          @search_item = params[:search]
        else
          @shows = Show.all.order("created_at DESC")
        end
  end

  def show
    @show = Show.find(params[:id])
  end
end
