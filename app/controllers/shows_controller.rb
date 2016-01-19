class ShowsController < ApplicationController

  load_and_authorize_resource
  
  def new
    @show = Show.new
  end

  def create
     @show = Show.new(show_params)
      if @show.save
        redirect_to(shows_path)
      else
      render :new
    end
  
  end

  def update
    Show.find(params[:id]).update(show_params)

    redirect_to(shows_path)
  end

  def edit
    @show = Show.find(params[:id])
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

  private

  def show_params
       params.require(:show).permit(:title, :image, :description, :link)
  end



end
