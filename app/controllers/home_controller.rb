class HomeController < ApplicationController

  before_action :authenticate_user!, only: [:admin]

    def index
        
        @performances = Performance.newest_performances  
    end

    def admin
      @venues = Venue.all.order("name")
      @shows = Show.all.order("title")
      @genres = Genre.all.order("name")
      @performances = Performance.all.joins(:show).order("shows.title")
    end

end
