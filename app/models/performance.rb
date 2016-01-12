class Performance < ActiveRecord::Base
  has_many :users, through: :bookings
  has_many :bookings
  belongs_to :genre
  belongs_to :show
  belongs_to :venue

  scope :venue_check, -> (v_id){where("venue_id == ?", v_id)}
  scope :finish_after,  -> (start){where("finish > ?", start)}
  scope :start_before, -> (finish){where("start < ?", finish)}
  scope :overlap_check, -> (v_id,start,finish){venue_check(v_id).finish_after(start).start_before(finish)}


  def self.search(query)
      # where(:title, query) -> This would return an exact match of the query
      where("date", "%#{query}%") 
    end

end
