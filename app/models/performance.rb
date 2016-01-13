class Performance < ActiveRecord::Base
  has_many :users, through: :bookings
  has_many :bookings, dependent: :destroy
  belongs_to :genre
  belongs_to :show
  belongs_to :venue

  scope :venue_check, -> (v_id){where("venue_id == ?", v_id)}
  scope :finish_after,  -> (start){where("finish > ?", start)}
  scope :start_before, -> (finish){where("start < ?", finish)}
  scope :overlap_check, -> (v_id,start,finish){venue_check(v_id).finish_after(start).start_before(finish)}


  def self.search(query)
      # where(:title, query) -> This would return an exact match of the query
      where("start", "%#{query}%") 
    end

  def human_readable_start_date
       start.strftime('%A, %B %-d %Y')
    end

  def human_readable_start_time
       start.strftime('%H:%M')
     end

  def human_readable_end_date
       finish.strftime('%A, %B %-d %Y')
     end

  def human_readable_end_time
       finish.strftime('%H:%M')
     end

  def duration_in_minutes
    ((finish - start)/60).to_i
  end

  def tickets_sold
        array = self.bookings.map do |booking| booking.tickets
        end
        array.sum
  end

  def remaining_capacity
    capacity = self.venue.capacity.to_i
    capacity - self.tickets_sold
  end


  end
