class Show < ActiveRecord::Base
  has_many :performances, dependent: :destroy
  has_many :bookings, through: :performances


  def self.search(query)
      # where(:title, query) -> This would return an exact match of the query
      where("title like ?", "%#{query}%") 
    end
end
