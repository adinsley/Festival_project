class AddLinkToShow < ActiveRecord::Migration
  def change
    add_column :shows, :link, :string
  end
end
