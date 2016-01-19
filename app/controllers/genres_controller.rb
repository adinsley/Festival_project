class GenresController < ApplicationController

  load_and_authorize_resource
  
  def new
    @genre =Genre.new
  end

  def create
    Genre.create(genre_params)
    redirect_to(genres_path)
  end

  def index
      if params[:genre_id]
            @genres = Genre.search(params[:genre_id]).order("created_at DESC")
          else
            @genres = Genre.all.order("created_at DESC")
          end
  end

  def show
    @genre = Genre.find(params[:id])
  end

  private

  def genre_params
       params.require(:genre).permit(:name)
  end

end
