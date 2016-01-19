class HomeController < ApplicationController
    def index
        
        @performances = Performance.newest_performances  
    end

    def admin
      @venues = Venue.all
      @shows = Show.all
      @genres = Genre.all
      @performances = Performance.all.joins(:show).order("shows.title")
    end

end
