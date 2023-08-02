# app/models/customer.rb

class Customer < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :admin
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
end
