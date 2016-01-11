class Venue < ActiveRecord::Base
  has_many :performances
  has_many :bookings, through: :performances

  def self.search(query)
      # where(:title, query) -> This would return an exact match of the query
      where("name || loaction like ?", "%#{query}%")

    end
end
