class SearchController < ApplicationController
    def index
        performances = Performance.search(params[:search])
        venues = Venue.search(params[:search])
        shows = Show.search(params[:search])

        @results = performances + venues + shows       
      end

end
