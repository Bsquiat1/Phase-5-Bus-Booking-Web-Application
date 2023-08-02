class Bus < ApplicationRecord
  belongs_to :driver
  has_many :bookings
  

  validates :number_of_seats, :cost_per_seat, :route, :time_of_travel, :registration_number, presence: true
  validates :registration_number, uniqueness: true
end
