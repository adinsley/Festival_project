class AddStartEndToPerformance < ActiveRecord::Migration
  def change
    add_column :performances, :start, :datetime
    add_column :performances, :end, :datetime
  end
end
