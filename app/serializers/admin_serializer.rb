class AdminSerializer < ActiveModel::Serializer
  attributes :id, :name, :email,:super
  
  has_many :customers
  has_many :driver
end
