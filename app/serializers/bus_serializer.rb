class BusSerializer < ActiveModel::Serializer
  attributes :id, :number_of_seats, :cost_per_seat, :route, :time_of_travel, :registration_number
  belongs_to :driver
  has_many :bookings

end
