class Venue < ActiveRecord::Base
  has_many :performances
  has_many :bookings, through: :performances
end
