class Customer < ApplicationRecord
    has_one :booking
  
    validates :name, :email, :password_digest, presence: true
  end
  