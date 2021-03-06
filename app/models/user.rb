class User < ActiveRecord::Base
  has_many :performances, through: :bookings
  has_many :bookings
  has_many :interests
  has_many :genres, through: :interests
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  

  
  def role? (role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

  def self.find_booking(current_user)
    User.find do |user| user.booking == current_user
    end
  end

  def suggest_performances
    genre_array = self.genres.map do |genre| 
      genre.performances.map do |performance| 
        performance 
      end 
    end
    performance_array = genre_array.flatten
    performance_array.sample(4)
  end


end
