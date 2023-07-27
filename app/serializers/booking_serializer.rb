class BookingSerializer < ActiveModel::Serializer
  attributes :id , :customer_id, :bus_id
  belongs_to :customer
  belongs_to :bus
end
