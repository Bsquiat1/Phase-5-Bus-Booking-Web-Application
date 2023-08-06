# app/serializers/driver_serializer.rb

class DriverSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :buses
end
