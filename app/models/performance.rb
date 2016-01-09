class Performance < ActiveRecord::Base
  belongs_to :genre
  belongs_to :show
  belongs_to :venue
end
