class GenresController < ApplicationController
  
  def new
    @genre =Genre.new
  end

  def index
      if params[:genre_id]
            @genres = Genre.search(params[:genre_id]).order("created_at DESC")
          else
            @genres = Genre.all.order("created_at DESC")
          end
    end

end
