class SearchController < ApplicationController
    def index
        performances = Performance.search(params[:q])
        venues = Venue.search(params[:q])
        shows = Show.search(params[:q])

        @results = performances + venues + shows       
      end

end
