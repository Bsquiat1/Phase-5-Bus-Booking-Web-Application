class Bus < ApplicationRecord
  belongs_to :driver
  has_many :bookings, dependent: :destroy
  has_many :customers, through: :bookings

  
  validates :registration_number, uniqueness: true
end
