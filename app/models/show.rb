class Show < ActiveRecord::Base
  has_many :performances, dependent: :destroy
  has_many :bookings, through: :performances

  validates :title, presence: true, uniqueness: true
  validates :description, length: {maximum: 2000, too_long:"2000 characters is the maximum allowed description"} 


  def self.search(query)
      # where(:title, query) -> This would return an exact match of the query
      where("title || description like ?", "%#{query}%") 
    end
end
