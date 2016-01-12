class ShowsController < ApplicationController
  def new
    @show = Show.new
  end

  def create
    Show.create(show_params)

    redirect_to(shows_path)
  end

  def update
    Show.update(show_params)

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
