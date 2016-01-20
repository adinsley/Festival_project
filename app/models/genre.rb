class Genre < ActiveRecord::Base
  has_many :performances
  has_many :bookings, through: :performances
  has_many :interests
  has_many :users, through: :interests

  def self.search(query)
      # where(:title, query) -> This would return an exact match of the query
      where("name like ?", "%#{query}%") 
  end

end
