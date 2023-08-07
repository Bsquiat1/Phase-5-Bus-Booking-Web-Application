class AdminSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  
  has_many :customers
  has_many :drivers
end
