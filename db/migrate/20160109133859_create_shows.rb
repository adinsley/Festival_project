class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.string :image
      t.text :description

      t.timestamps null: false
    end
  end
end
