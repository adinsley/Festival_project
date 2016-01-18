class Venue < ActiveRecord::Base
  has_many :performances, dependent: :destroy
  has_many :bookings, through: :performances

  validates :name, :capacity, presence: true
  validates :loaction, presence: {message: "An address must be added"}
  validates :capacity, numericality: {only_integer: true, greater_than: 5}
  validates :name, :loaction, uniqueness: {message: "Venue Name or Address are linked to exsisting venue"}
  validates :description, length: {maximum: 2000, too_long:"2000 characters is the maximum allowed description"}

  def self.search(query)
      # where(:title, query) -> This would return an exact match of the query
      where("name || loaction like ?", "%#{query}%")

    end
end
