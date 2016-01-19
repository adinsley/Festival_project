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

 validates :start, :finish, :price, presence: true
 validates :price, numericality: {greater_than: 0}
 validates :restrictions, :description, length: {maximum: 2000, too_long:"2000 characters is the maximum allowed in restrictions and description"}
 validate :finish_time_is_after_start_time
 validate :set_max_duration



  def self.search(query)
      # where(:title, query) -> This would return an exact match of the query
      where("description", "%#{query}%") 
  end

  def self.newest_performances
      all = Performance.all.order(("created_at DESC"))
      all.first(4)
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

  def finish_time_is_after_start_time

      if self.finish < self.start 
        errors.add(:finish, "cannot be before the start time") 
      end 
  end

  def set_max_duration
    if ((self.finish - self.start)/3600) > 6
      errors.add(:finish, "Duration of performance cannot be more than 6 hours") 
    end
  end

end
