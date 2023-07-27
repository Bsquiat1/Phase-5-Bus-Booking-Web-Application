
# app/models/booking.rb

class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :bus

  validates :seat_number, presence: true
end
