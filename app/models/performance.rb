class Performance < ActiveRecord::Base
  has_many :users, through: :bookings
  has_many :bookings
  belongs_to :genre
  belongs_to :show
  belongs_to :venue
end
