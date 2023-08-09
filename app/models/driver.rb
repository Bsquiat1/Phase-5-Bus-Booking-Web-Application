# app/models/driver.rb

class Driver < ApplicationRecord
  has_many :buses

  belongs_to :admin 
  accepts_nested_attributes_for :buses
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
 

  has_secure_password
end
