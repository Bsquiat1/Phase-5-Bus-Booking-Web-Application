class CreateBuses < ActiveRecord::Migration[6.0]
  def change
    create_table :buses do |t|
      t.integer :number_of_seats, null: false
      t.decimal :cost_per_seat, null: false
      t.string :route, null: false
      t.datetime :time_of_travel, null: false
      t.references :driver, foreign_key: true, null: false
      t.string :registration_number, null: false, unique: true

      t.timestamps null: false
    end
  end
end
