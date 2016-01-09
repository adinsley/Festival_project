class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :performance, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :tickets

      t.timestamps null: false
    end
  end
end
