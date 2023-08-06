# app/models/driver.rb

class Driver < ApplicationRecord
  has_many :buses

  belongs_to :admin 
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :registration_number, presence: true
  validates :route, presence: true

  has_secure_password
end
