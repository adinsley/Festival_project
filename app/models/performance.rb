class Performance < ActiveRecord::Base
  has_many :users, through: :bookings
  has_many :bookings
  belongs_to :genre
  belongs_to :show
  belongs_to :venue

  
  

  def self.search(query)
      # where(:title, query) -> This would return an exact match of the query
      where("date", "%#{query}%") 
    end




end
