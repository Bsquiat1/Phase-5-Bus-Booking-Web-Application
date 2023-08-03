# app/serializers/customer_serializer.rb

class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password_digest
  has_many :bookings
end
