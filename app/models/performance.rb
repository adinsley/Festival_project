class Performance < ActiveRecord::Base
  has_many :users, through: :bookings
  has_many :bookings
  belongs_to :genre
  belongs_to :show
  belongs_to :venue

  scope :venue_check, -> (v_id){where("venue_id == ?", v_id)}
  scope :before_end,  -> (start){where("end < ?", start)}
  scope :after_start, -> (finish){where("start > ?", finish)}


  
  

  def self.search(query)
      # where(:title, query) -> This would return an exact match of the query
      where("date", "%#{query}%") 
    end

  def overlap_check(v_id, start, finish)
     venue_check(v_id).before_end(start) && venue_check(v_id).after_start(finish)
  end




end
