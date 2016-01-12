class RemoveEndFromPerformance < ActiveRecord::Migration
  def change
    remove_column :performances, :end, :string
  end
end
