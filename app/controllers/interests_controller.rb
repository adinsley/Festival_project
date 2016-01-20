class InterestsController < ApplicationController

before_action :authenticate_user!

  def index
    
  end

  def new
    @oldinterests = Interest.where({user_id:current_user.id})
    
    @oldinterests.each do |interest|
      interest.delete
    end

    @interest = Interest.new
    @genres = Genre.all

  end

  def create
 
    params[:interest][:genre_id].each do |genreid|
      if genreid.present?
   Interest.create(user_id: current_user.id, genre_id: genreid)
 end
    end
    redirect_to(root_path)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def interest_params
      params.require(:interest).permit(:user_id, :genre_id)
    end




  
end