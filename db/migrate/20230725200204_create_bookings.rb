class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :seat_number, null: false
      t.references :customer, foreign_key: true, null: false
      t.references :bus, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
