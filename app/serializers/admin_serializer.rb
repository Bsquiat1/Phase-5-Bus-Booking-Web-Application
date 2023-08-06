class AdminSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password
  
  has_many :customers
  has_many :drivers
end
