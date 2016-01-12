class RemoveDateFromPerformance1 < ActiveRecord::Migration
  def change
    remove_column :performances, :date, :date
  end
end
