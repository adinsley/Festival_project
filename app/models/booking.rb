class Booking < ActiveRecord::Base
  belongs_to :performance
  belongs_to :user

  scope :finish_after,  -> (start){ joins(:performance).where("finish > ?", start)}
  scope :start_before,  -> (finish){ joins(:performance).where("start < ?", finish)}
  scope :overlap_check, -> (start,finish){finish_after(start).start_before(finish)}

  validates :tickets, numericality: {only_integer: true, greater_than: 0} 

end
