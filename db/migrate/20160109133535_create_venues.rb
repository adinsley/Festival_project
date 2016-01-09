class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :image
      t.string :description
      t.text :loaction

      t.timestamps null: false
    end
  end
end
