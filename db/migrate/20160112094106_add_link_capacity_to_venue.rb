class AddLinkCapacityToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :link, :string
    add_column :venues, :capacity, :integer
  end
end
