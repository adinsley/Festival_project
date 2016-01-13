class SearchController < ApplicationController
    def index
        
        venues = Venue.search(params[:search])
        shows = Show.search(params[:search])
       
        @results = venues + shows       
      end

end
