class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.references :genre, index: true, foreign_key: true
      t.references :show, index: true, foreign_key: true
      t.references :venue, index: true, foreign_key: true
      t.date :date
      t.integer :price
      t.string :restrictions
      t.string :description

      t.timestamps null: false
    end
  end
end
