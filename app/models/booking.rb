
# app/models/booking.rb

class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :bus
  
  validates :seat_number, presence: true
  validate :seat_number_uniqueness_for_bus
  private

  def seat_number_uniqueness_for_bus
    return unless bus

    if bus.bookings.where(seat_number: seat_number).exists?
      errors.add(:seat_number, "already taken for this bus")
    end
  end
end
