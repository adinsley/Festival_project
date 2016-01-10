class GenresController < ApplicationController
  
  def new
    @genre =Genre.new
  end


  def index
    @genres = Genre.all
  end

  
end
