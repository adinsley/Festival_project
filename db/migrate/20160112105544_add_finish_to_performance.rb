class AddFinishToPerformance < ActiveRecord::Migration
  def change
    add_column :performances, :finish, :datetime
  end
end
